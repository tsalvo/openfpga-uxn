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
entity lda_0CLK_c634cda8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c634cda8;
architecture arch of lda_0CLK_c634cda8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1412_c6_bce3]
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1412_c2_ac34]
signal t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_c7b0]
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1425_c7_5097]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1425_c7_5097]
signal tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1425_c7_5097]
signal t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1428_c11_d206]
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1428_c7_3d1c]
signal t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1430_c3_5a0a]
signal CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1432_c11_a3e3]
signal BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1432_c7_d185]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1432_c7_d185]
signal tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1432_c7_d185]
signal t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1433_c3_8427]
signal BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1434_c30_51aa]
signal sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_8311]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1437_c7_53c5]
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_8352]
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_3fe9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_3fe9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_3fe9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1440_c7_3fe9]
signal result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1440_c7_3fe9]
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(7 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9f32( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : signed;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
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
      base.u16_value := ref_toks_7;
      base.sp_relative_shift := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left,
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right,
BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34
result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34
result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34
result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34
tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- t16_MUX_uxn_opcodes_h_l1412_c2_ac34
t16_MUX_uxn_opcodes_h_l1412_c2_ac34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond,
t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue,
t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse,
t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right,
BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097
result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097
result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097
result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1425_c7_5097
tmp8_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- t16_MUX_uxn_opcodes_h_l1425_c7_5097
t16_MUX_uxn_opcodes_h_l1425_c7_5097 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond,
t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue,
t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse,
t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left,
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right,
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c
tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- t16_MUX_uxn_opcodes_h_l1428_c7_3d1c
t16_MUX_uxn_opcodes_h_l1428_c7_3d1c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond,
t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue,
t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse,
t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a
CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x,
CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3
BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left,
BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right,
BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185
result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185
result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185
result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185
result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185
result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1432_c7_d185
tmp8_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- t16_MUX_uxn_opcodes_h_l1432_c7_d185
t16_MUX_uxn_opcodes_h_l1432_c7_d185 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond,
t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue,
t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse,
t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427
BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left,
BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right,
BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa
sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins,
sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x,
sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y,
sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5
tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond,
tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue,
tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse,
tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right,
BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9
result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9
tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond,
tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output,
 CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output,
 sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_d042 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1417_c3_1cca : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_9fa2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1438_c3_4a07 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1443_c3_eedd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1433_l1429_DUPLICATE_e776_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1448_l1407_DUPLICATE_6755_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_9fa2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_9fa2;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1417_c3_1cca := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1417_c3_1cca;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1438_c3_4a07 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1438_c3_4a07;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1443_c3_eedd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1443_c3_eedd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_d042 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1422_c3_d042;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1440_c11_8352] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_left;
     BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output := BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_8311] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1425_c11_c7b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1432_c11_a3e3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output := result.u16_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1412_c6_bce3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1433_l1429_DUPLICATE_e776 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1433_l1429_DUPLICATE_e776_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1428_c11_d206] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_left;
     BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output := BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1434_c30_51aa] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_ins;
     sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_x;
     sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output := sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd_return_output := result.sp_relative_shift;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1412_c6_bce3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1425_c11_c7b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_d206_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1432_c11_a3e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_8311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1440_c11_8352_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1433_l1429_DUPLICATE_e776_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1433_l1429_DUPLICATE_e776_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1425_l1437_l1428_DUPLICATE_11fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1425_l1428_l1412_l1432_DUPLICATE_d34e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_269f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_DUPLICATE_2da5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1428_l1440_l1432_DUPLICATE_dea7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1440_l1437_l1432_l1428_l1425_l1412_DUPLICATE_2735_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1412_c2_ac34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1434_c30_51aa_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1440_c7_3fe9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1430_c3_5a0a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output := CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1440_c7_3fe9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1433_c3_8427] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_left;
     BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output := BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1440_c7_3fe9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond;
     tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output := tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1440_c7_3fe9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1440_c7_3fe9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1433_c3_8427_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1430_c3_5a0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1440_c7_3fe9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- t16_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_53c5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_53c5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- t16_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1432_c7_d185] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_cond;
     tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output := tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1432_c7_d185_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1428_c7_3d1c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_cond;
     tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output := tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1428_c7_3d1c_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- t16_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1425_c7_5097] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1425_c7_5097_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1412_c2_ac34] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1448_l1407_DUPLICATE_6755 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1448_l1407_DUPLICATE_6755_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9f32(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1412_c2_ac34_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1448_l1407_DUPLICATE_6755_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9f32_uxn_opcodes_h_l1448_l1407_DUPLICATE_6755_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
