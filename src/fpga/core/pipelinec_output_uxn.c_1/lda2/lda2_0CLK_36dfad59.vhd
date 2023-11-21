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
-- Submodules: 60
entity lda2_0CLK_36dfad59 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_36dfad59;
architecture arch of lda2_0CLK_36dfad59 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1610_c6_4883]
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1610_c2_1ce3]
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_2d34]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1618_c7_f734]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1618_c7_f734]
signal t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1618_c7_f734]
signal tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1620_c30_b323]
signal sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1622_c11_45df]
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1622_c7_60b7]
signal tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1628_c11_fa44]
signal BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1628_c7_05f5]
signal tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1629_c22_b47e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_e539]
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1631_c7_36be]
signal result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1631_c7_36be]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_36be]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1631_c7_36be]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1631_c7_36be]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1631_c7_36be]
signal tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1633_c3_cfcb]
signal CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_abec]
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(15 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(3 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1635_c7_a38e]
signal tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1636_c3_e7bf]
signal BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_f8cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output : unsigned(0 downto 0);

-- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1642_c7_ab5a]
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_ab5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_ab5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8152( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_stack_operation_16bit := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left,
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right,
BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- t16_MUX_uxn_opcodes_h_l1610_c2_1ce3
t16_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3
tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond,
tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- t16_MUX_uxn_opcodes_h_l1618_c7_f734
t16_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1618_c7_f734
tmp16_MUX_uxn_opcodes_h_l1618_c7_f734 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond,
tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue,
tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse,
tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1620_c30_b323
sp_relative_shift_uxn_opcodes_h_l1620_c30_b323 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins,
sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x,
sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y,
sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left,
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right,
BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7
result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7
result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- t16_MUX_uxn_opcodes_h_l1622_c7_60b7
t16_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7
tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond,
tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44
BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left,
BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right,
BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5
result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5
result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5
result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5
tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond,
tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e
BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be
result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1631_c7_36be
tmp16_MUX_uxn_opcodes_h_l1631_c7_36be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond,
tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue,
tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse,
tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb
CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x,
CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e
result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e
tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond,
tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf
BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left,
BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right,
BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output);

-- result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse,
result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output,
 sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output,
 CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output,
 result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_13be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1629_c3_6f30 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_0250 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1622_l1610_DUPLICATE_0ad8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1618_DUPLICATE_7122_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1636_l1632_DUPLICATE_4277_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1606_l1648_DUPLICATE_2fa4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_0250 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_0250;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_13be := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_13be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left := VAR_phase;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := VAR_previous_stack_read;
     VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := tmp16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1618_DUPLICATE_7122 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1618_DUPLICATE_7122_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_e539] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_left;
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output := BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_2d34] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1629_c22_b47e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1610_c6_4883] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_left;
     BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output := BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1620_c30_b323] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_ins;
     sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_x;
     sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output := sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1636_l1632_DUPLICATE_4277 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1636_l1632_DUPLICATE_4277_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1622_c11_45df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_abec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output := result.is_stack_operation_16bit;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1628_c11_fa44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1622_l1610_DUPLICATE_0ad8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1622_l1610_DUPLICATE_0ad8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_f8cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1610_c6_4883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_2d34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1622_c11_45df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1628_c11_fa44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_e539_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_abec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_f8cd_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1629_c3_6f30 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1629_c22_b47e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1636_l1632_DUPLICATE_4277_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1636_l1632_DUPLICATE_4277_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1618_DUPLICATE_7122_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1610_l1618_DUPLICATE_7122_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1635_l1610_l1618_l1631_DUPLICATE_e8d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1635_l1631_l1628_l1622_l1618_DUPLICATE_7b24_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1622_l1610_DUPLICATE_0ad8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1622_l1610_DUPLICATE_0ad8_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_operation_16bit_d41d_uxn_opcodes_h_l1628_l1642_l1618_l1631_DUPLICATE_f60b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1610_l1642_l1631_l1628_l1622_l1618_DUPLICATE_8d17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1631_l1628_l1622_l1618_DUPLICATE_707a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1620_c30_b323_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1629_c3_6f30;
     -- CONST_SL_8[uxn_opcodes_h_l1633_c3_cfcb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output := CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1642_c7_ab5a] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1642_c7_ab5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_ab5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1636_c3_e7bf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_left;
     BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output := BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output;

     -- t16_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1636_c3_e7bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1633_c3_cfcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1642_c7_ab5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_a38e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- t16_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1635_c7_a38e_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_36be] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1631_c7_36be_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1628_c7_05f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1628_c7_05f5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1622_c7_60b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1622_c7_60b7_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_f734] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output := result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1618_c7_f734_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_is_stack_operation_16bit_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1610_c2_1ce3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_cond;
     tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output := tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;

     -- Submodule level 8
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1606_l1648_DUPLICATE_2fa4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1606_l1648_DUPLICATE_2fa4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8152(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_is_stack_operation_16bit_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1610_c2_1ce3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1606_l1648_DUPLICATE_2fa4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8152_uxn_opcodes_h_l1606_l1648_DUPLICATE_2fa4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
