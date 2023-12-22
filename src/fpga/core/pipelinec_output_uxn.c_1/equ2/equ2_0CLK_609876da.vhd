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
-- BIN_OP_EQ[uxn_opcodes_h_l1215_c6_b4f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1215_c2_cbab]
signal t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_9caf]
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1228_c7_69dd]
signal t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_ff03]
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1231_c7_ef7b]
signal t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_507b]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1236_c7_6f6f]
signal t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1237_c3_79f1]
signal BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1240_c11_486c]
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1240_c7_aab0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1244_c11_e71c]
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1244_c7_8b13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1245_c3_14b8]
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1246_c30_41c5]
signal sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c21_1468]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1249_c21_b544]
signal MUX_uxn_opcodes_h_l1249_c21_b544_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1249_c21_b544_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c21_b544_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1249_c21_b544_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c580( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6
BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1215_c2_cbab
n16_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab
result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab
result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab
result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- t16_MUX_uxn_opcodes_h_l1215_c2_cbab
t16_MUX_uxn_opcodes_h_l1215_c2_cbab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond,
t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue,
t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse,
t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right,
BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output);

-- n16_MUX_uxn_opcodes_h_l1228_c7_69dd
n16_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- t16_MUX_uxn_opcodes_h_l1228_c7_69dd
t16_MUX_uxn_opcodes_h_l1228_c7_69dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond,
t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue,
t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse,
t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right,
BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output);

-- n16_MUX_uxn_opcodes_h_l1231_c7_ef7b
n16_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b
result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- t16_MUX_uxn_opcodes_h_l1231_c7_ef7b
t16_MUX_uxn_opcodes_h_l1231_c7_ef7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond,
t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue,
t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse,
t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output);

-- n16_MUX_uxn_opcodes_h_l1236_c7_6f6f
n16_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- t16_MUX_uxn_opcodes_h_l1236_c7_6f6f
t16_MUX_uxn_opcodes_h_l1236_c7_6f6f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond,
t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue,
t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse,
t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1
BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left,
BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right,
BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left,
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right,
BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output);

-- n16_MUX_uxn_opcodes_h_l1240_c7_aab0
n16_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0
result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left,
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right,
BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output);

-- n16_MUX_uxn_opcodes_h_l1244_c7_8b13
n16_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13
result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8
BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left,
BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right,
BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5
sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins,
sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x,
sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y,
sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468
BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output);

-- MUX_uxn_opcodes_h_l1249_c21_b544
MUX_uxn_opcodes_h_l1249_c21_b544 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1249_c21_b544_cond,
MUX_uxn_opcodes_h_l1249_c21_b544_iftrue,
MUX_uxn_opcodes_h_l1249_c21_b544_iffalse,
MUX_uxn_opcodes_h_l1249_c21_b544_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000
CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output,
 n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output,
 n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output,
 n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output,
 n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output,
 n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output,
 n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output,
 sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output,
 MUX_uxn_opcodes_h_l1249_c21_b544_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1225_c3_6fb6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1220_c3_9558 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_28a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_b7a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_af73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_d6c6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c21_b544_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1249_c21_b544_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1240_l1244_DUPLICATE_dfc0_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1253_l1211_DUPLICATE_a204_return_output : opcode_result_t;
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
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_d6c6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_d6c6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_28a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1229_c3_28a1;
     VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1220_c3_9558 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1220_c3_9558;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1225_c3_6fb6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1225_c3_6fb6;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_b7a7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_b7a7;
     VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_af73 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1238_c3_af73;
     VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1215_c6_b4f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1240_c11_486c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1246_c30_41c5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_ins;
     sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_x;
     sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output := sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1244_c11_e71c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1228_c11_9caf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1231_c11_ff03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1240_l1244_DUPLICATE_dfc0 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1240_l1244_DUPLICATE_dfc0_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_507b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1215_c6_b4f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1228_c11_9caf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1231_c11_ff03_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_507b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1240_c11_486c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1244_c11_e71c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1232_l1237_l1241_l1245_DUPLICATE_b436_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_6bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b695_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1244_l1240_l1236_l1231_l1228_DUPLICATE_b8e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1240_l1244_DUPLICATE_dfc0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1240_l1244_DUPLICATE_dfc0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1215_l1244_l1240_l1236_l1231_l1228_DUPLICATE_a470_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1215_c2_cbab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1246_c30_41c5_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1245_c3_14b8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_left;
     BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output := BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1237_c3_79f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_left;
     BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output := BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1237_c3_79f1_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1245_c3_14b8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1233_l1242_DUPLICATE_a000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     -- t16_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c21_1468] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1249_c21_b544_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c21_1468_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- MUX[uxn_opcodes_h_l1249_c21_b544] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1249_c21_b544_cond <= VAR_MUX_uxn_opcodes_h_l1249_c21_b544_cond;
     MUX_uxn_opcodes_h_l1249_c21_b544_iftrue <= VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iftrue;
     MUX_uxn_opcodes_h_l1249_c21_b544_iffalse <= VAR_MUX_uxn_opcodes_h_l1249_c21_b544_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1249_c21_b544_return_output := MUX_uxn_opcodes_h_l1249_c21_b544_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue := VAR_MUX_uxn_opcodes_h_l1249_c21_b544_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1244_c7_8b13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output := result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;

     -- n16_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1244_c7_8b13_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     -- n16_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1240_c7_aab0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1240_c7_aab0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;
     -- n16_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_6f6f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_6f6f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1231_c7_ef7b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1231_c7_ef7b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1228_c7_69dd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1228_c7_69dd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1215_c2_cbab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output := result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1253_l1211_DUPLICATE_a204 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1253_l1211_DUPLICATE_a204_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c580(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1215_c2_cbab_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1253_l1211_DUPLICATE_a204_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c580_uxn_opcodes_h_l1253_l1211_DUPLICATE_a204_return_output;
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
