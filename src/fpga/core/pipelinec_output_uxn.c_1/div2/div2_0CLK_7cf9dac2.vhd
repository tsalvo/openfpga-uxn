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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_899e]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_7418]
signal n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_7418]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_7418]
signal t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_7418]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_56d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_7065]
signal n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_7065]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_7065]
signal t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_7065]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_7065]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_7065]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_7065]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_7065]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_7778]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_a160]
signal n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_a160]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_a160]
signal t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_a160]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_a160]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_a160]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_a160]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_a160]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_fef2]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_ffc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_3aec]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_ce26]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_9f6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_37c1]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_5e6c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_f73d]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_c96a]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_a9dc]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_d25a]
signal MUX_uxn_opcodes_h_l2121_c11_d25a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_d25a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_7dc4]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_882b]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_acc8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_acc8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_acc8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_acc8]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_badc]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_7418
n16_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_7418
tmp16_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_7418
t16_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_7065
n16_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_7065
tmp16_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_7065
t16_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_a160
n16_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_a160
tmp16_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_a160
t16_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_ffc0
n16_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0
tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_ffc0
t16_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec
BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_9f6a
n16_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a
tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_5e6c
n16_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c
tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d
BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_d25a
MUX_uxn_opcodes_h_l2121_c11_d25a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_d25a_cond,
MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue,
MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse,
MUX_uxn_opcodes_h_l2121_c11_d25a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4
sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_badc
CONST_SR_8_uxn_opcodes_h_l2130_c31_badc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output,
 MUX_uxn_opcodes_h_l2121_c11_d25a_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_ac82 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_9234 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_b158 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_7575 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_f9a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_91bb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_0c6d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d590 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_52c0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_aa1a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_a4b0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2134_l2086_DUPLICATE_59bd_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_91bb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_91bb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_b158 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_b158;
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_9234 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_9234;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_52c0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_52c0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_f9a5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_f9a5;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_7575 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_7575;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_ac82 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_ac82;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d590 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_d590;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_badc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_56d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_7418_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_7dc4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_ce26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_a4b0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_a4b0_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output := result.sp_relative_shift;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_882b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_37c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_7778] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_fef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_7418_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_899e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_c96a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_899e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_56d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_7778_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_fef2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_ce26_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_37c1_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_c96a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_882b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2116_l2120_l2107_l2112_DUPLICATE_5cfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2103_l2127_l2115_l2111_l2106_DUPLICATE_a41f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2103_l2127_l2119_l2115_l2111_l2106_DUPLICATE_6be8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2103_l2119_l2115_l2111_l2106_DUPLICATE_6d84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_a4b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_a4b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2103_l2090_l2127_l2115_l2111_l2106_DUPLICATE_039a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_7dc4_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_3aec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_aa1a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_aa1a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_badc_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_f73d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_acc8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_acc8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_acc8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_3aec_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_f73d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_aa1a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_54b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;
     -- t16_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_acc8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_a9dc] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_a9dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_acc8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     -- MUX[uxn_opcodes_h_l2121_c11_d25a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_d25a_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_cond;
     MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_return_output := MUX_uxn_opcodes_h_l2121_c11_d25a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_0c6d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_0c6d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_d25a_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_0c6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     -- n16_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_5e6c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_5e6c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_9f6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_9f6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_ffc0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_ffc0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_a160] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_a160_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_7065] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_7065_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_7418] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2134_l2086_DUPLICATE_59bd LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2134_l2086_DUPLICATE_59bd_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_7418_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_7418_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2134_l2086_DUPLICATE_59bd_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l2134_l2086_DUPLICATE_59bd_return_output;
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
