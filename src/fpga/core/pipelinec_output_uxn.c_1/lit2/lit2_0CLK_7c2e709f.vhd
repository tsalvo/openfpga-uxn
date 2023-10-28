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
-- Submodules: 64
entity lit2_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_7c2e709f;
architecture arch of lit2_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l226_c6_1086]
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l226_c1_a00b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l226_c2_5781]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l226_c2_5781]
signal tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l227_c3_fc33[uxn_opcodes_h_l227_c3_fc33]
signal printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l233_c11_8864]
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l233_c7_a4e2]
signal tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l237_c11_b8bf]
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l237_c7_ddb5]
signal tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l239_c3_2bd2]
signal CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_454f]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_64e6]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l242_c7_6317]
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_6317]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l243_c22_9c72]
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l245_c11_4fb0]
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l245_c7_99a3]
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l245_c7_99a3]
signal tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l246_c3_ddd4]
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l248_c22_20c5]
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l253_c11_1392]
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l253_c7_8bf1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_8bf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_8bf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l253_c7_8bf1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l253_c7_8bf1]
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l256_c31_e97a]
signal CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l258_c11_acfe]
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l258_c7_c684]
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l258_c7_c684]
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7de8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left,
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right,
BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781
result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781
result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- tmp16_MUX_uxn_opcodes_h_l226_c2_5781
tmp16_MUX_uxn_opcodes_h_l226_c2_5781 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond,
tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue,
tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse,
tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

-- printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33
printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33 : entity work.printf_uxn_opcodes_h_l227_c3_fc33_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864
BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left,
BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right,
BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2
result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2
result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2
tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond,
tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue,
tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse,
tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf
BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right,
BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5
result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5
result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5
tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond,
tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue,
tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse,
tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2
CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x,
CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6
BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317
result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317
result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_6317
tmp16_MUX_uxn_opcodes_h_l242_c7_6317 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left,
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right,
BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0
BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right,
BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3
result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3
result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l245_c7_99a3
tmp16_MUX_uxn_opcodes_h_l245_c7_99a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond,
tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4
BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left,
BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right,
BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left,
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right,
BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392
BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right,
BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1
result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l256_c31_e97a
CONST_SR_8_uxn_opcodes_h_l256_c31_e97a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x,
CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe
BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left,
BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right,
BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output,
 CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output,
 CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_03cb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_5781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_a4e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l240_c3_b7db : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l243_c3_4ce8 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_8efc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l248_c3_8ca6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_99a3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_a843_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_0a37 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_66ae_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l238_l246_DUPLICATE_587d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l263_l221_DUPLICATE_c665_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_0a37 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l255_c3_0a37;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_8efc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l250_c3_8efc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_03cb := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l229_c3_03cb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l245_c11_4fb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_a4e2_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l248_c22_20c5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l226_c6_1086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_left;
     BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output := BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l258_c11_acfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_99a3_return_output := result.u16_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l243_c22_9c72] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_left;
     BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output := BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l237_c11_b8bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_454f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l233_c11_8864] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_left;
     BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output := BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l256_c31_e97a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output := CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_64e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_5781_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l253_c11_1392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_left;
     BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output := BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output := result.is_pc_updated;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l238_l246_DUPLICATE_587d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l238_l246_DUPLICATE_587d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l226_c6_1086_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l233_c11_8864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l237_c11_b8bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_64e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l245_c11_4fb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l253_c11_1392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l258_c11_acfe_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l240_c3_b7db := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_454f_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l243_c3_4ce8 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l243_c22_9c72_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l248_c3_8ca6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l248_c22_20c5_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l238_l246_DUPLICATE_587d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l238_l246_DUPLICATE_587d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l245_DUPLICATE_8b92_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_3c7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l242_l258_l237_l253_l233_l226_DUPLICATE_3389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_7f86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l242_l237_l253_l233_l226_DUPLICATE_f8c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l226_c2_5781_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l240_c3_b7db;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue := VAR_result_u16_value_uxn_opcodes_h_l243_c3_4ce8;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := VAR_result_u16_value_uxn_opcodes_h_l248_c3_8ca6;
     -- BIN_OP_OR[uxn_opcodes_h_l246_c3_ddd4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_left;
     BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output := BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l256_c21_66ae] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_66ae_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l256_c31_e97a_return_output);

     -- result_u16_value_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l253_c7_8bf1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l258_c7_c684] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l253_c7_8bf1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l239_c3_2bd2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output := CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l226_c1_a00b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l258_c7_c684] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l256_c21_66ae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l239_c3_2bd2_return_output;
     VAR_printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l226_c1_a00b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l258_c7_c684_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l258_c7_c684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l253_c7_8bf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l253_c7_8bf1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output := result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- printf_uxn_opcodes_h_l227_c3_fc33[uxn_opcodes_h_l227_c3_fc33] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l227_c3_fc33_uxn_opcodes_h_l227_c3_fc33_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l251_c21_a843] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_a843_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l246_c3_ddd4_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l253_c7_8bf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l251_c21_a843_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l253_c7_8bf1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l245_c7_99a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l245_c7_99a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l242_c7_6317] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_cond;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output := result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_6317_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l237_c7_ddb5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l237_c7_ddb5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output := tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l233_c7_a4e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l233_c7_a4e2_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l226_c2_5781_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l226_c2_5781] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l263_l221_DUPLICATE_c665 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l263_l221_DUPLICATE_c665_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7de8(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l226_c2_5781_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l226_c2_5781_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l263_l221_DUPLICATE_c665_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7de8_uxn_opcodes_h_l263_l221_DUPLICATE_c665_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
