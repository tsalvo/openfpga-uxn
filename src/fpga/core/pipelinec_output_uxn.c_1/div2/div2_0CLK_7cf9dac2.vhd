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
-- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_18a7]
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3867]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2090_c2_3867]
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2090_c2_3867]
signal t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2090_c2_3867]
signal n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_dd9d]
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2103_c7_ecaa]
signal n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_3c51]
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_e547]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_e547]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_e547]
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_e547]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_e547]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2106_c7_e547]
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2106_c7_e547]
signal t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2106_c7_e547]
signal n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_ae6b]
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_c194]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_c194]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_c194]
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_c194]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_c194]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2111_c7_c194]
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2111_c7_c194]
signal t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2111_c7_c194]
signal n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2112_c3_307e]
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_3a14]
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_2068]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_2068]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_2068]
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_2068]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_2068]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2115_c7_2068]
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2115_c7_2068]
signal n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_c757]
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2119_c7_d0d7]
signal n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2120_c3_2495]
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_1b2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_810e]
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2121_c11_5e87]
signal MUX_uxn_opcodes_h_l2121_c11_5e87_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2121_c11_5e87_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2122_c30_e8db]
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_9478]
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_a362]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_a362]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_a362]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_a362]
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2130_c31_8ab3]
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right,
BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2090_c2_3867
tmp16_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- t16_MUX_uxn_opcodes_h_l2090_c2_3867
t16_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- n16_MUX_uxn_opcodes_h_l2090_c2_3867
n16_MUX_uxn_opcodes_h_l2090_c2_3867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond,
n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue,
n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse,
n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right,
BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa
tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- t16_MUX_uxn_opcodes_h_l2103_c7_ecaa
t16_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- n16_MUX_uxn_opcodes_h_l2103_c7_ecaa
n16_MUX_uxn_opcodes_h_l2103_c7_ecaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond,
n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue,
n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse,
n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right,
BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2106_c7_e547
tmp16_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- t16_MUX_uxn_opcodes_h_l2106_c7_e547
t16_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- n16_MUX_uxn_opcodes_h_l2106_c7_e547
n16_MUX_uxn_opcodes_h_l2106_c7_e547 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond,
n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue,
n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse,
n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right,
BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2111_c7_c194
tmp16_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- t16_MUX_uxn_opcodes_h_l2111_c7_c194
t16_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- n16_MUX_uxn_opcodes_h_l2111_c7_c194
n16_MUX_uxn_opcodes_h_l2111_c7_c194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond,
n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue,
n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse,
n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e
BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right,
BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right,
BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2115_c7_2068
tmp16_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- n16_MUX_uxn_opcodes_h_l2115_c7_2068
n16_MUX_uxn_opcodes_h_l2115_c7_2068 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond,
n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue,
n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse,
n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right,
BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7
tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- n16_MUX_uxn_opcodes_h_l2119_c7_d0d7
n16_MUX_uxn_opcodes_h_l2119_c7_d0d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond,
n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue,
n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse,
n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right,
BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right,
BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output);

-- MUX_uxn_opcodes_h_l2121_c11_5e87
MUX_uxn_opcodes_h_l2121_c11_5e87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2121_c11_5e87_cond,
MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue,
MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse,
MUX_uxn_opcodes_h_l2121_c11_5e87_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db
sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins,
sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x,
sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y,
sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right,
BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3
CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x,
CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output,
 MUX_uxn_opcodes_h_l2121_c11_5e87_return_output,
 sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output,
 CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_f899 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_2ce1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c9dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8245 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7269 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a350 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_8670_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_8659 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_e439 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_ce6d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_db0d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2086_l2134_DUPLICATE_6168_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7269 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2113_c3_7269;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c9dc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2104_c3_c9dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8245 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2109_c3_8245;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_8659 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2129_c3_8659;
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y := resize(to_signed(-2, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a350 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2124_c3_a350;
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_2ce1 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2100_c3_2ce1;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_f899 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2095_c3_f899;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_e439 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2128_c3_e439;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := tmp16;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3867_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l2130_c31_8ab3] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output := CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2122_c30_e8db] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_ins;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_x;
     sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output := sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2119_c11_c757] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_left;
     BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output := BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2121_c11_1b2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2106_c11_3c51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_left;
     BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output := BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2090_c6_18a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2115_c11_3a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_left;
     BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output := BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2103_c11_dd9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output := result.is_ram_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3867_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2111_c11_ae6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2127_c11_9478] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_left;
     BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output := BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_db0d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_db0d_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2090_c6_18a7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2103_c11_dd9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2106_c11_3c51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2111_c11_ae6b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2115_c11_3a14_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2119_c11_c757_return_output;
     VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2121_c11_1b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2127_c11_9478_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2107_l2112_l2116_l2120_DUPLICATE_d7a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2115_l2111_DUPLICATE_8bfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2106_l2103_l2127_l2119_l2115_l2111_DUPLICATE_91b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2106_l2103_l2119_l2115_l2111_DUPLICATE_a8af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_db0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2127_l2115_DUPLICATE_db0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2106_l2103_l2090_l2127_l2115_l2111_DUPLICATE_2b8d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2122_c30_e8db_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2120_c3_2495] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_left;
     BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output := BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2127_c7_a362] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2112_c3_307e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_left;
     BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output := BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2127_c7_a362] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2130_c21_ce6d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_ce6d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2130_c31_8ab3_return_output);

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2127_c7_a362] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2112_c3_307e_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2120_c3_2495_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2130_c21_ce6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2117_l2108_DUPLICATE_6ab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2127_c7_a362] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output := result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2121_c26_810e] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_left;
     BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output := BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2121_c26_810e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2127_c7_a362_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- n16_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- MUX[uxn_opcodes_h_l2121_c11_5e87] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2121_c11_5e87_cond <= VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_cond;
     MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue <= VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iftrue;
     MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse <= VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_return_output := MUX_uxn_opcodes_h_l2121_c11_5e87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2125_c21_8670] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_8670_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_MUX_uxn_opcodes_h_l2121_c11_5e87_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- t16_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- n16_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2125_c21_8670_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2119_c7_d0d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- t16_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2119_c7_d0d7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- n16_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2115_c7_2068] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output := result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2115_c7_2068_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2111_c7_c194] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output := result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- n16_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2111_c7_c194_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2106_c7_e547] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output := result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2106_c7_e547_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2103_c7_ecaa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2103_c7_ecaa_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2090_c2_3867] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output := result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2086_l2134_DUPLICATE_6168 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2086_l2134_DUPLICATE_6168_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2090_c2_3867_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2090_c2_3867_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2086_l2134_DUPLICATE_6168_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e6e6_uxn_opcodes_h_l2086_l2134_DUPLICATE_6168_return_output;
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
