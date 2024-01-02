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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_c070]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_ba41]
signal n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_ba41]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_ba41]
signal t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_ba41]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_388d]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_af99]
signal n16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_af99]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_af99]
signal t16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_af99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_af99]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_af99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_af99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_af99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_6733]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_5265]
signal n16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_5265]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_5265]
signal t16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_5265]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_5265]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_5265]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_5265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_5265]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_59da]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_a193]
signal n16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_a193]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_a193]
signal t16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_a193]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_a193]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_a193]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_a193]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_a193]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_d5d1]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_fc38]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_a18e]
signal n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_a18e]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_a18e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_a18e]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_a18e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_a18e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_a18e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_e1c2]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_78d1]
signal n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_78d1]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_78d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_78d1]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_78d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_78d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_78d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_52f5]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_f854]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_507f]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_7103]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_b527]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_b527]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_b527]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_b527]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_5e35]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070
BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_ba41
n16_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_ba41
tmp16_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_ba41
t16_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41
result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d
BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_af99
n16_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_af99_cond,
n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_af99
tmp16_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_af99
t16_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_af99_cond,
t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99
result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733
BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_5265
n16_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_5265_cond,
n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_5265
tmp16_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_5265
t16_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_5265_cond,
t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265
result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da
BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_a193
n16_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_a193_cond,
n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_a193
tmp16_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_a193
t16_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_a193_cond,
t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193
result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1
BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38
BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_a18e
n16_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_a18e
tmp16_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e
result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2
BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_78d1
n16_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_78d1
tmp16_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1
result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5
BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_f854
BIN_OP_AND_uxn_opcodes_h_l970_c11_f854 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_507f
sp_relative_shift_uxn_opcodes_h_l971_c30_507f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103
BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_5e35
CONST_SR_8_uxn_opcodes_h_l979_c31_5e35 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_a915 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_4922 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_6c19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_93a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_c4d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_cdec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_a692_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ee41 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_9092 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_3c2d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_ed91_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l935_l983_DUPLICATE_f8d0_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_6c19 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_6c19;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_a915 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_a915;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_9092 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_9092;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ee41 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ee41;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_c4d3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_c4d3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_4922 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_4922;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_93a4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_93a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_cdec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_cdec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right := to_unsigned(6, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := tmp16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_6733] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_507f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_388d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_7103] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_ba41_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_ba41_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_fc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_ed91 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_ed91_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_e1c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_c070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_5e35] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_59da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_c070_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_388d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_6733_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_59da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_fc38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_e1c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_7103_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l969_l965_l956_l961_DUPLICATE_062f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l976_l955_l964_l960_l952_DUPLICATE_5189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l976_l955_l964_l960_l968_l952_DUPLICATE_d096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l955_l964_l960_l968_l952_DUPLICATE_b113_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_ed91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l964_l976_DUPLICATE_ed91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l976_l955_l939_l964_l960_l952_DUPLICATE_6c25_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_507f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_b527] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_b527] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_3c2d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_3c2d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5e35_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_b527] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_52f5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_d5d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d5d1_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_52f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_3c2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_77b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b527_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b527_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b527_return_output;
     -- n16_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output := t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_f854] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_b527] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b527_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_a692] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_a692_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_f854_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- t16_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output := t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_a692_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_78d1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output := t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output := n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_78d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output := n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- t16_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_a18e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_a18e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     -- n16_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output := n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_a193] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_a193_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_5265] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_5265_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_af99] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_af99_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_ba41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l935_l983_DUPLICATE_f8d0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l935_l983_DUPLICATE_f8d0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_ba41_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_ba41_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l935_l983_DUPLICATE_f8d0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l935_l983_DUPLICATE_f8d0_return_output;
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
