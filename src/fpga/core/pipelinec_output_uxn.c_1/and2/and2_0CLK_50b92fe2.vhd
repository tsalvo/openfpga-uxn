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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_a67b]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_c7c1]
signal t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_a7ef]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_1f67]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_1f67]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_1f67]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_1f67]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_1f67]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_1f67]
signal n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_1f67]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_1f67]
signal t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_55ff]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0226]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0226]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0226]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0226]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0226]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_0226]
signal n16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_0226]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_0226]
signal t16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_12ae]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_b3dd]
signal t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_6674]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_afb6]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_94ff]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_94ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_94ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_94ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_94ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_94ff]
signal n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_94ff]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_87f9]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_ce49]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_ce49]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_ce49]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_ce49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_ce49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_ce49]
signal n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_ce49]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_5bfa]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_5bff]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_74d7]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_9cea]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_8eea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_8eea]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_8eea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_8eea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_caae]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b
BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_c7c1
n16_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1
tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_c7c1
t16_MUX_uxn_opcodes_h_l939_c2_c7c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond,
t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef
BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67
result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_1f67
n16_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_1f67
tmp16_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_1f67
t16_MUX_uxn_opcodes_h_l952_c7_1f67 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond,
t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff
BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_0226
n16_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_0226_cond,
n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_0226
tmp16_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_0226
t16_MUX_uxn_opcodes_h_l955_c7_0226 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_0226_cond,
t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae
BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd
result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_b3dd
n16_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd
tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_b3dd
t16_MUX_uxn_opcodes_h_l960_c7_b3dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond,
t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_6674
BIN_OP_OR_uxn_opcodes_h_l961_c3_6674 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6
BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff
result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_94ff
n16_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_94ff
tmp16_MUX_uxn_opcodes_h_l964_c7_94ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9
BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49
result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_ce49
n16_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_ce49
tmp16_MUX_uxn_opcodes_h_l968_c7_ce49 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa
BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff
BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_74d7
sp_relative_shift_uxn_opcodes_h_l971_c30_74d7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea
BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea
result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_caae
CONST_SR_8_uxn_opcodes_h_l979_c31_caae : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_78ae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_d643 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa35 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_3566 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_25cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_edcd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_3bde_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ffc4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_d45e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_89c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f996_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l935_l983_DUPLICATE_056f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_d45e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_d45e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ffc4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_ffc4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_d643 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_d643;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa35 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_aa35;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_3566 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_3566;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_78ae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_78ae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_edcd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_edcd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_25cc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_25cc;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l979_c31_caae] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_a7ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_a67b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_74d7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_9cea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f996 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f996_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_55ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_87f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_12ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_afb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_a67b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_a7ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_55ff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_12ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_afb6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_87f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_9cea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l956_l969_l965_DUPLICATE_d41d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_b036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_2096_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_0831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f996_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_f996_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_c4c5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_74d7_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_89c6] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_89c6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_caae_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_8eea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_6674] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_8eea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_8eea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_5bfa] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_6674_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_5bfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_89c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_2151_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_5bff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_8eea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_8eea_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     -- t16_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output := t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_3bde] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_3bde_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_5bff_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- n16_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_3bde_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_ce49] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_ce49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     -- t16_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_94ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output := n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_94ff_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- n16_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_b3dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_b3dd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0226] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0226_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_1f67] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_1f67_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_c7c1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l935_l983_DUPLICATE_056f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l935_l983_DUPLICATE_056f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_c7c1_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l935_l983_DUPLICATE_056f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l935_l983_DUPLICATE_056f_return_output;
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
