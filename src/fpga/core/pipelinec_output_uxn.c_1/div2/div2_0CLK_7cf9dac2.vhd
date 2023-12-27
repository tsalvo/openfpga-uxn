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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_2020]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_3374]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3374]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_3374]
signal t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_3374]
signal n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_ca8e]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_c18b]
signal n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_0b04]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_33c7]
signal n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_7fda]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_696b]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_696b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_696b]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_696b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_696b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_696b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_696b]
signal t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_696b]
signal n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_0697]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_2c55]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_f71e]
signal n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_a036]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_487b]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_487b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_487b]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_487b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_487b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_487b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_487b]
signal n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_e983]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_9256]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_f643]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_afd1]
signal MUX_uxn_opcodes_h_l2121_c11_afd1_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_afd1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_9d93]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_0812]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_ff30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_ff30]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_ff30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ff30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_cef9]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_3374
tmp16_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_3374
t16_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_3374
n16_MUX_uxn_opcodes_h_l2090_c2_3374 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b
tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_c18b
t16_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_c18b
n16_MUX_uxn_opcodes_h_l2103_c7_c18b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7
tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_33c7
t16_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_33c7
n16_MUX_uxn_opcodes_h_l2106_c7_33c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_696b
tmp16_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_696b
t16_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_696b
n16_MUX_uxn_opcodes_h_l2111_c7_696b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697
BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e
tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_f71e
n16_MUX_uxn_opcodes_h_l2115_c7_f71e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_487b
tmp16_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_487b
n16_MUX_uxn_opcodes_h_l2119_c7_487b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983
BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_afd1
MUX_uxn_opcodes_h_l2121_c11_afd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_afd1_cond,
MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue,
MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse,
MUX_uxn_opcodes_h_l2121_c11_afd1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93
sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9
CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output,
 MUX_uxn_opcodes_h_l2121_c11_afd1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1a80 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_914f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_29b8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_fb1b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4ac8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_fbd3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_c9ba_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_df13 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_6543 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_6b92_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_d8a6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2086_l2134_DUPLICATE_f335_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_fbd3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_fbd3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_df13 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_df13;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_29b8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_29b8;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_6543 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_6543;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4ac8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_4ac8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_fb1b := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_fb1b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1a80 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_1a80;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_914f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_914f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right := to_unsigned(2, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := tmp16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_9d93] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3374_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_ca8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_2020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_2c55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_0812] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_a036] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_7fda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3374_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_9256] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_d8a6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_d8a6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_0b04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_cef9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_2020_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_ca8e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_0b04_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_7fda_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_2c55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_a036_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_9256_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_0812_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2116_l2120_l2112_DUPLICATE_9efe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2127_l2119_l2115_l2111_l2106_l2103_DUPLICATE_b98a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2119_l2115_l2111_l2106_l2103_DUPLICATE_d8a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_d8a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_d8a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2090_l2127_l2115_l2111_l2106_l2103_DUPLICATE_4851_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_9d93_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_6b92] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_6b92_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_cef9_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_0697] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_ff30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_ff30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_ff30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_e983] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_0697_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_e983_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_6b92_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2108_l2117_DUPLICATE_74d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;
     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_f643] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output;

     -- t16_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_ff30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_f643_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_ff30_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_afd1] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_afd1_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_cond;
     MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_return_output := MUX_uxn_opcodes_h_l2121_c11_afd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     -- t16_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_c9ba] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_c9ba_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_afd1_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_c9ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     -- t16_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_487b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_487b_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_f71e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_f71e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_696b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_696b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_33c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_33c7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_c18b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_c18b_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3374] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2086_l2134_DUPLICATE_f335 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2086_l2134_DUPLICATE_f335_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3374_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3374_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2086_l2134_DUPLICATE_f335_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l2086_l2134_DUPLICATE_f335_return_output;
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
