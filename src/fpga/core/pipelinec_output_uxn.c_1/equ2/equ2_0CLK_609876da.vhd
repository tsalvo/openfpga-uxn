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
-- Submodules: 58
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_ce02]
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1197_c2_3cf0]
signal n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7aec]
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1210_c7_1e38]
signal n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_084d]
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1213_c7_d532]
signal t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_d532]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_d532]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_d532]
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_d532]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_d532]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1213_c7_d532]
signal n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_47a0]
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1218_c7_b30d]
signal n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1219_c3_4c08]
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_0568]
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_889f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_889f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_889f]
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_889f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_889f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1222_c7_889f]
signal n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_8cea]
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1226_c7_2aed]
signal n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a1d1]
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1228_c30_81f6]
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_c5ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1231_c21_2eab]
signal MUX_uxn_opcodes_h_l1231_c21_2eab_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1231_c21_2eab_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_71f0( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right,
BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output);

-- t16_MUX_uxn_opcodes_h_l1197_c2_3cf0
t16_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- n16_MUX_uxn_opcodes_h_l1197_c2_3cf0
n16_MUX_uxn_opcodes_h_l1197_c2_3cf0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond,
n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue,
n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse,
n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right,
BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output);

-- t16_MUX_uxn_opcodes_h_l1210_c7_1e38
t16_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- n16_MUX_uxn_opcodes_h_l1210_c7_1e38
n16_MUX_uxn_opcodes_h_l1210_c7_1e38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond,
n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue,
n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse,
n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right,
BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output);

-- t16_MUX_uxn_opcodes_h_l1213_c7_d532
t16_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- n16_MUX_uxn_opcodes_h_l1213_c7_d532
n16_MUX_uxn_opcodes_h_l1213_c7_d532 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond,
n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue,
n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse,
n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right,
BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output);

-- t16_MUX_uxn_opcodes_h_l1218_c7_b30d
t16_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- n16_MUX_uxn_opcodes_h_l1218_c7_b30d
n16_MUX_uxn_opcodes_h_l1218_c7_b30d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond,
n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue,
n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse,
n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08
BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right,
BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right,
BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- n16_MUX_uxn_opcodes_h_l1222_c7_889f
n16_MUX_uxn_opcodes_h_l1222_c7_889f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond,
n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue,
n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse,
n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right,
BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- n16_MUX_uxn_opcodes_h_l1226_c7_2aed
n16_MUX_uxn_opcodes_h_l1226_c7_2aed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond,
n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue,
n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse,
n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right,
BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6
sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins,
sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x,
sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y,
sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output);

-- MUX_uxn_opcodes_h_l1231_c21_2eab
MUX_uxn_opcodes_h_l1231_c21_2eab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1231_c21_2eab_cond,
MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue,
MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse,
MUX_uxn_opcodes_h_l1231_c21_2eab_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output,
 t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output,
 t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output,
 t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output,
 t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output,
 MUX_uxn_opcodes_h_l1231_c21_2eab_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_a575 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_2bc4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cfc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_60ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ea14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_7078 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_aa02_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1193_l1235_DUPLICATE_e904_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_7078 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_7078;
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_a575 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1202_c3_a575;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_60ee := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1216_c3_60ee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cfc1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1211_c3_cfc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_2bc4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1207_c3_2bc4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ea14 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1220_c3_ea14;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right := to_unsigned(3, 2);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1210_c11_7aec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1226_c11_8cea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1197_c6_ce02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_left;
     BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output := BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_aa02 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_aa02_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1222_c11_0568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_left;
     BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output := BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1213_c11_084d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1218_c11_47a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1228_c30_81f6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_ins;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_x;
     sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output := sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output := result.is_vram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1197_c6_ce02_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1210_c11_7aec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1213_c11_084d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1218_c11_47a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1222_c11_0568_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1226_c11_8cea_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1223_l1214_l1227_l1219_DUPLICATE_62c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_9ed0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_bf02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1213_l1210_l1226_l1222_l1218_DUPLICATE_6bdc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_aa02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1222_l1226_DUPLICATE_aa02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1213_l1210_l1197_l1226_l1222_l1218_DUPLICATE_899b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1228_c30_81f6_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1219_c3_4c08] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_left;
     BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output := BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1227_c3_a1d1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_left;
     BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output := BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1219_c3_4c08_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1227_c3_a1d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1215_l1224_DUPLICATE_6592_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     -- t16_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c21_c5ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c21_c5ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- MUX[uxn_opcodes_h_l1231_c21_2eab] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1231_c21_2eab_cond <= VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_cond;
     MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue <= VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iftrue;
     MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse <= VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_return_output := MUX_uxn_opcodes_h_l1231_c21_2eab_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue := VAR_MUX_uxn_opcodes_h_l1231_c21_2eab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- t16_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1226_c7_2aed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output := result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;

     -- n16_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1226_c7_2aed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     -- n16_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- t16_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1222_c7_889f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1222_c7_889f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1218_c7_b30d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1218_c7_b30d_return_output;
     -- n16_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1213_c7_d532] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output := result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1213_c7_d532_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1210_c7_1e38] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output := result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1210_c7_1e38_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1197_c2_3cf0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1193_l1235_DUPLICATE_e904 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1193_l1235_DUPLICATE_e904_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_71f0(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1197_c2_3cf0_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1193_l1235_DUPLICATE_e904_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_71f0_uxn_opcodes_h_l1193_l1235_DUPLICATE_e904_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
