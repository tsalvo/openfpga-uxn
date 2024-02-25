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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_b6ff]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_c4b7]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_f327]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_4a02]
signal t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_4a02]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_4a02]
signal n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_4a02]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_4a02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_4a02]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_4a02]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_4a02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_c77b]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_e7c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_3c07]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_48f2]
signal t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_48f2]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_48f2]
signal n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_48f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_48f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_48f2]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_48f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_48f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_d981]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_0e4d]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_e197]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_e197]
signal n16_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_e197]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_e197]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_e197]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_e197]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_e197]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_c976]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_f6c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_1dd8]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_5936]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_0b24]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_3e3e]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_b44a]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_b44a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_b44a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_b44a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_5602]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff
BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_c4b7
t16_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7
tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_c4b7
n16_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327
BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_4a02
t16_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_4a02
tmp16_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_4a02
n16_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02
result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b
BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_e7c6
t16_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6
tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_e7c6
n16_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07
BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_48f2
t16_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_48f2
tmp16_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_48f2
n16_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2
result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_d981
BIN_OP_OR_uxn_opcodes_h_l961_c3_d981 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d
BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_e197
tmp16_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_e197
n16_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_e197_cond,
n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197
result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7
tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_f6c7
n16_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8
BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_5936
BIN_OP_AND_uxn_opcodes_h_l970_c11_5936 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_0b24
sp_relative_shift_uxn_opcodes_h_l971_c30_0b24 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e
BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_5602
CONST_SR_8_uxn_opcodes_h_l979_c31_5602 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_4266 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_31ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_8fdb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4b05 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_8ed6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_70f3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_2130_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_d903 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_f38a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b94a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_7cd3_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l935_l983_DUPLICATE_aa25_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_8ed6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_8ed6;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_d903 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_d903;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_8fdb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_8fdb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_4266 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_4266;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_70f3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_70f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_f38a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_f38a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4b05 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_4b05;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_31ab := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_31ab;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_c77b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_b6ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_c976] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_0e4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_0b24] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_3e3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_7cd3 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_7cd3_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_3c07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_f327] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_5602] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_b6ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_f327_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_c77b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_3c07_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_0e4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_c976_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_3e3e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l965_l956_l961_l969_DUPLICATE_23ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l952_l976_l964_l960_l955_DUPLICATE_1a2f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l952_l976_l968_l964_l960_l955_DUPLICATE_60a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l952_l968_l964_l960_l955_DUPLICATE_e2e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_7cd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_7cd3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l952_l939_l976_l964_l960_l955_DUPLICATE_dd1d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0b24_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_b44a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_1dd8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_d981] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_b44a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_b94a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b94a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_5602_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_b44a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_d981_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1dd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_b94a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l966_l957_DUPLICATE_7052_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_5936] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_b44a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_b44a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     -- n16_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output := n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- t16_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_2130] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_2130_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5936_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_2130_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     -- t16_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_f6c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_f6c7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_e197] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- t16_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_e197_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- n16_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_48f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_48f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_e7c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_e7c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_4a02] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_4a02_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_c4b7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l935_l983_DUPLICATE_aa25 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l935_l983_DUPLICATE_aa25_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c4b7_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l935_l983_DUPLICATE_aa25_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l935_l983_DUPLICATE_aa25_return_output;
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
