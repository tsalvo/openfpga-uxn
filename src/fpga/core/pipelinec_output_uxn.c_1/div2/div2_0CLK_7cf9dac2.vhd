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
-- Submodules: 73
entity div2_0CLK_7cf9dac2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_7cf9dac2;
architecture arch of div2_0CLK_7cf9dac2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2113_c6_af0b]
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2113_c2_0275]
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2113_c2_0275]
signal t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2113_c2_0275]
signal n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2113_c2_0275]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2126_c11_f805]
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2126_c7_fa88]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_a068]
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_01a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2134_c11_fee0]
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2134_c7_11dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2135_c3_7992]
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_a48c]
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2138_c7_0972]
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2138_c7_0972]
signal n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_0972]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_0972]
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_0972]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_0972]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_0972]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_92c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2142_c7_061b]
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2142_c7_061b]
signal n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_061b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2142_c7_061b]
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_061b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_061b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_061b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2143_c3_d6c1]
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_0d6b]
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2144_c26_6376]
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2144_c11_6606]
signal MUX_uxn_opcodes_h_l2144_c11_6606_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_6606_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_6606_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2144_c11_6606_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2145_c30_7905]
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_494e]
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_fe4f]
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_fe4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_fe4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_fe4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2153_c31_16ae]
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left,
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right,
BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2113_c2_0275
tmp16_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- t16_MUX_uxn_opcodes_h_l2113_c2_0275
t16_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- n16_MUX_uxn_opcodes_h_l2113_c2_0275
n16_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left,
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right,
BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88
tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- t16_MUX_uxn_opcodes_h_l2126_c7_fa88
t16_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- n16_MUX_uxn_opcodes_h_l2126_c7_fa88
n16_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right,
BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4
tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- t16_MUX_uxn_opcodes_h_l2129_c7_01a4
t16_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- n16_MUX_uxn_opcodes_h_l2129_c7_01a4
n16_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left,
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right,
BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd
tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- t16_MUX_uxn_opcodes_h_l2134_c7_11dd
t16_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- n16_MUX_uxn_opcodes_h_l2134_c7_11dd
n16_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992
BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left,
BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right,
BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right,
BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2138_c7_0972
tmp16_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- n16_MUX_uxn_opcodes_h_l2138_c7_0972
n16_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2142_c7_061b
tmp16_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- n16_MUX_uxn_opcodes_h_l2142_c7_061b
n16_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1
BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left,
BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right,
BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right,
BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left,
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right,
BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output);

-- MUX_uxn_opcodes_h_l2144_c11_6606
MUX_uxn_opcodes_h_l2144_c11_6606 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2144_c11_6606_cond,
MUX_uxn_opcodes_h_l2144_c11_6606_iftrue,
MUX_uxn_opcodes_h_l2144_c11_6606_iffalse,
MUX_uxn_opcodes_h_l2144_c11_6606_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2145_c30_7905
sp_relative_shift_uxn_opcodes_h_l2145_c30_7905 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins,
sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x,
sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y,
sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right,
BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae
CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x,
CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output,
 tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output,
 tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output,
 tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output,
 MUX_uxn_opcodes_h_l2144_c11_6606_return_output,
 sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_40d9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_9448 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_8d60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_af90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_90fb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_c137 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_6606_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2144_c11_6606_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_9872_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_a53f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_af60 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_6ea2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_0fc7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2157_l2109_DUPLICATE_0b9a_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_90fb := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2136_c3_90fb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_40d9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2118_c3_40d9;
     VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_9448 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2123_c3_9448;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_af90 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2132_c3_af90;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_c137 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2147_c3_c137;
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y := resize(to_signed(-2, 3), 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_a53f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2151_c3_a53f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_af60 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2152_c3_af60;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_8d60 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2127_c3_8d60;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output := result.u8_value;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output := result.is_ram_write;

     -- CONST_SR_8[uxn_opcodes_h_l2153_c31_16ae] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output := CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2134_c11_fee0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2126_c11_f805] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_left;
     BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output := BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2113_c6_af0b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_0275_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2129_c11_a068] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_left;
     BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output := BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2150_c11_494e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2142_c11_92c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_0275_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l2145_c30_7905] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_ins;
     sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_x;
     sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output := sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2144_c11_0d6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2138_c11_a48c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_0fc7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_0fc7_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2113_c6_af0b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2126_c11_f805_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2129_c11_a068_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2134_c11_fee0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2138_c11_a48c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2142_c11_92c2_return_output;
     VAR_MUX_uxn_opcodes_h_l2144_c11_6606_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2144_c11_0d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2150_c11_494e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2139_l2130_l2135_l2143_DUPLICATE_bfb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2126_l2150_l2138_l2134_l2129_DUPLICATE_46b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2126_l2150_l2142_l2138_l2134_l2129_DUPLICATE_5268_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2126_l2142_l2138_l2134_l2129_DUPLICATE_0364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_0fc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2138_l2150_DUPLICATE_0fc7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2126_l2113_l2150_l2138_l2134_l2129_DUPLICATE_edc6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2145_c30_7905_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2143_c3_d6c1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_left;
     BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output := BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2153_c21_6ea2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_6ea2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2153_c31_16ae_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2150_c7_fe4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2135_c3_7992] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_left;
     BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output := BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2150_c7_fe4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2150_c7_fe4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2135_c3_7992_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2143_c3_d6c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2153_c21_6ea2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2131_l2140_DUPLICATE_eef5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;
     -- n16_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- t16_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2150_c7_fe4f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2144_c26_6376] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_left;
     BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output := BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2144_c26_6376_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2150_c7_fe4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- MUX[uxn_opcodes_h_l2144_c11_6606] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2144_c11_6606_cond <= VAR_MUX_uxn_opcodes_h_l2144_c11_6606_cond;
     MUX_uxn_opcodes_h_l2144_c11_6606_iftrue <= VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iftrue;
     MUX_uxn_opcodes_h_l2144_c11_6606_iffalse <= VAR_MUX_uxn_opcodes_h_l2144_c11_6606_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2144_c11_6606_return_output := MUX_uxn_opcodes_h_l2144_c11_6606_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- n16_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- t16_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_MUX_uxn_opcodes_h_l2144_c11_6606_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- n16_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2148_c21_9872] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_9872_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2144_c11_6606_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2148_c21_9872_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- n16_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2142_c7_061b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2142_c7_061b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- n16_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2138_c7_0972] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output := result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2138_c7_0972_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- n16_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2134_c7_11dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2134_c7_11dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2129_c7_01a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2129_c7_01a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2126_c7_fa88] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output := result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2126_c7_fa88_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2113_c2_0275] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output := result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2157_l2109_DUPLICATE_0b9a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2157_l2109_DUPLICATE_0b9a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2113_c2_0275_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2113_c2_0275_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2157_l2109_DUPLICATE_0b9a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l2157_l2109_DUPLICATE_0b9a_return_output;
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
