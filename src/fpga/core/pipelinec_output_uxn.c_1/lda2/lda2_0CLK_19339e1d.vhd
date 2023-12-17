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
-- BIN_OP_EQ[uxn_opcodes_h_l1783_c6_02a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1783_c2_275d]
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(15 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c2_275d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1783_c2_275d]
signal t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1783_c2_275d]
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_dd9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1796_c7_4ef7]
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1799_c11_f0ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1799_c7_2bec]
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1801_c3_a9a3]
signal CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_f461]
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(15 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_5a33]
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1804_c3_8fe3]
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1805_c30_e893]
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1808_c11_58ba]
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1808_c7_f7f2]
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1810_c22_067e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_b496]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1812_c7_5d76]
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_a9f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1818_c7_3e56]
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_3e56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_3e56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1818_c7_3e56]
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- t16_MUX_uxn_opcodes_h_l1783_c2_275d
t16_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- t16_MUX_uxn_opcodes_h_l1796_c7_4ef7
t16_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- t16_MUX_uxn_opcodes_h_l1799_c7_2bec
t16_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3
CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x,
CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right,
BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- t16_MUX_uxn_opcodes_h_l1803_c7_5a33
t16_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3
BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left,
BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right,
BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1805_c30_e893
sp_relative_shift_uxn_opcodes_h_l1805_c30_e893 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins,
sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x,
sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y,
sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left,
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right,
BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output,
 CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_5c9f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_09a7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_949c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1810_c3_86e0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_f9c2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_391e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_cea3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_6f1e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1825_l1778_DUPLICATE_729c_return_output : opcode_result_t;
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
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_5c9f := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1788_c3_5c9f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_09a7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1793_c3_09a7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_391e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_391e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_949c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1797_c3_949c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_f9c2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1809_c3_f9c2;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_cea3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1820_c3_cea3;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := t16;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse := tmp8_low;
     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_275d_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c11_dd9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_a9f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1808_c11_58ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1783_c6_02a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1799_c11_f0ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_275d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_b496] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1803_c11_f461] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_left;
     BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output := BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_6f1e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_6f1e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1805_c30_e893] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_ins;
     sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_x;
     sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output := sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1810_c22_067e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1783_c6_02a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c11_dd9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1799_c11_f0ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1803_c11_f461_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1808_c11_58ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_b496_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_a9f4_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1810_c3_86e0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1810_c22_067e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_6f1e_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1800_l1804_DUPLICATE_6f1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1796_l1808_l1799_DUPLICATE_853c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1783_l1796_l1808_l1799_DUPLICATE_f803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1812_l1808_l1803_DUPLICATE_8fb1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1799_l1796_l1812_l1808_l1803_DUPLICATE_b69b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1803_l1818_l1808_l1799_DUPLICATE_0a14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1799_l1796_l1818_l1783_l1808_l1803_DUPLICATE_4c1e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1805_c30_e893_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1810_c3_86e0;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_3e56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1804_c3_8fe3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_left;
     BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output := BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1818_c7_3e56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output := result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1818_c7_3e56] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output := tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1801_c3_a9a3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output := CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_3e56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1804_c3_8fe3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1801_c3_a9a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1818_c7_3e56_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1812_c7_5d76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output := result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1812_c7_5d76_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1808_c7_f7f2] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output := tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- t16_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1808_c7_f7f2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- t16_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1803_c7_5a33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1803_c7_5a33_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1799_c7_2bec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1799_c7_2bec_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c7_4ef7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1796_c7_4ef7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1783_c2_275d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;

     -- Submodule level 8
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1783_c2_275d_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1825_l1778_DUPLICATE_729c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1825_l1778_DUPLICATE_729c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1783_c2_275d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1783_c2_275d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1825_l1778_DUPLICATE_729c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_dfe4_uxn_opcodes_h_l1825_l1778_DUPLICATE_729c_return_output;
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
