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
entity lda2_0CLK_19339e1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_19339e1d;
architecture arch of lda2_0CLK_19339e1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_bd94]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_d728]
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_d728]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_d728]
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1761_c2_d728]
signal t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_8e9f]
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_a801]
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_a801]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_a801]
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1774_c7_a801]
signal t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_a2ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1777_c7_8b85]
signal t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1779_c3_9dbf]
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_69e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1781_c7_aa97]
signal t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1782_c3_52a5]
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1783_c30_002c]
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_2368]
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_6463]
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_6463]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_6463]
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_cb9f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_37ab]
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_f31a]
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_efc6]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_e35d]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_e35d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_e35d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(3 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_e35d]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- t16_MUX_uxn_opcodes_h_l1761_c2_d728
t16_MUX_uxn_opcodes_h_l1761_c2_d728 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond,
t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue,
t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse,
t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right,
BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- t16_MUX_uxn_opcodes_h_l1774_c7_a801
t16_MUX_uxn_opcodes_h_l1774_c7_a801 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond,
t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue,
t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse,
t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- t16_MUX_uxn_opcodes_h_l1777_c7_8b85
t16_MUX_uxn_opcodes_h_l1777_c7_8b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond,
t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue,
t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse,
t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf
CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x,
CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- t16_MUX_uxn_opcodes_h_l1781_c7_aa97
t16_MUX_uxn_opcodes_h_l1781_c7_aa97 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond,
t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue,
t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse,
t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5
BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right,
BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1783_c30_002c
sp_relative_shift_uxn_opcodes_h_l1783_c30_002c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins,
sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x,
sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y,
sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right,
BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right,
BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 tmp8_high,
 tmp8_low,
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output,
 CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ff9e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_cf2f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_5633 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1788_c3_32e6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_425e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_ed85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5a73 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_2e82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1803_l1756_DUPLICATE_7813_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_ed85 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_ed85;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5a73 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1798_c3_5a73;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right := to_unsigned(3, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_cf2f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1766_c3_cf2f;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_5633 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1775_c3_5633;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ff9e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1771_c3_ff9e;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_425e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1787_c3_425e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right := to_unsigned(0, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_efc6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output := result.is_stack_write;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1788_c22_cb9f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output := result.u16_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_d728_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c6_bd94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1783_c30_002c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_ins;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_x;
     sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output := sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1774_c11_8e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_d728_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_a2ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1790_c11_37ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1786_c11_2368] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_left;
     BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output := BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_2e82 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_2e82_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1781_c11_69e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c6_bd94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1774_c11_8e9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_a2ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1781_c11_69e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1786_c11_2368_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1790_c11_37ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_efc6_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1788_c3_32e6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1788_c22_cb9f_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_2e82_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1778_l1782_DUPLICATE_2e82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1774_l1786_l1777_DUPLICATE_bb88_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1761_l1774_l1786_l1777_DUPLICATE_568d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1796_l1790_l1786_l1781_l1777_l1774_DUPLICATE_96d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1790_l1786_l1781_l1777_l1774_DUPLICATE_028f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1781_l1796_l1786_l1777_DUPLICATE_8b55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1761_l1796_l1786_l1781_l1777_l1774_DUPLICATE_1a58_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1783_c30_002c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1788_c3_32e6;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1782_c3_52a5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_left;
     BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output := BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_e35d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_e35d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1779_c3_9dbf] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output := CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_e35d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_e35d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1782_c3_52a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1779_c3_9dbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_e35d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- t16_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1790_c7_f31a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1790_c7_f31a_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- t16_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1786_c7_6463] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output := result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1786_c7_6463_return_output;
     -- t16_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1781_c7_aa97] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1781_c7_aa97_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- t16_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1777_c7_8b85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output := result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1777_c7_8b85_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1774_c7_a801] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1774_c7_a801_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c2_d728] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1761_c2_d728_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1803_l1756_DUPLICATE_7813 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1803_l1756_DUPLICATE_7813_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d4(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1761_c2_d728_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c2_d728_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1803_l1756_DUPLICATE_7813_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d4_uxn_opcodes_h_l1803_l1756_DUPLICATE_7813_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
