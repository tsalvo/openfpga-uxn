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
-- BIN_OP_EQ[uxn_opcodes_h_l223_c6_ceb9]
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_314f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l223_c2_976b]
signal tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l223_c2_976b]
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l224_c3_6cde[uxn_opcodes_h_l224_c3_6cde]
signal printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l230_c11_9eaf]
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l230_c7_6325]
signal tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_6325]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l234_c11_6b55]
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l234_c7_1a76]
signal tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_1a76]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l236_c3_b410]
signal CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l237_c22_bccf]
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l239_c11_437a]
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l239_c7_81d5]
signal tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_81d5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_4299]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_9a42]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_4c41]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_4c41]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l243_c3_8a06]
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l245_c22_7f0b]
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l250_c11_ad16]
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l250_c7_05d4]
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_05d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_05d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_05d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_05d4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l253_c31_a441]
signal CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l255_c11_399c]
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_20ea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_20ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_pc_updated := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_sp_shift := ref_toks_7;
      base.u16_value := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9
BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l223_c2_976b
tmp16_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond,
tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b
result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b
result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

-- printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde
printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde : entity work.printf_uxn_opcodes_h_l224_c3_6cde_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf
BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l230_c7_6325
tmp16_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond,
tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325
result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325
result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55
BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l234_c7_1a76
tmp16_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76
result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76
result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output);

-- CONST_SL_8_uxn_opcodes_h_l236_c3_b410
CONST_SL_8_uxn_opcodes_h_l236_c3_b410 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x,
CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left,
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right,
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a
BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l239_c7_81d5
tmp16_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5
result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5
result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42
BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_4c41
tmp16_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41
result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41
result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06
BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left,
BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right,
BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left,
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right,
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4
result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l253_c31_a441
CONST_SR_8_uxn_opcodes_h_l253_c31_a441 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x,
CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c
BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output,
 tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output,
 tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output,
 tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output,
 CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output,
 tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output,
 BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output,
 CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_d08d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_976b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_6325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l237_c3_085b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l240_c3_4502 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l245_c3_8ab4 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_4c41_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_dc99 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_7104_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_aa04 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_9b49_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_c959_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l260_l218_DUPLICATE_8bfc_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_d08d := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_d08d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_aa04 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_aa04;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_dc99 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_dc99;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_9a42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l255_c11_399c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_left;
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output := BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l223_c6_ceb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l250_c11_ad16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_left;
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output := BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_6325_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_4299] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_976b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l239_c11_437a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_left;
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output := BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l253_c31_a441] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x <= VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output := CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_4c41_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l230_c11_9eaf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_left;
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output := BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l234_c11_6b55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_left;
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output := BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l237_c22_bccf] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_left;
     BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output := BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l245_c22_7f0b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_c959 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_c959_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_ceb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_9eaf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_6b55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_437a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_9a42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_ad16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_399c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l237_c3_085b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_bccf_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l240_c3_4502 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_4299_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l245_c3_8ab4 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_7f0b_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_c959_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_c959_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l239_l234_l230_l255_l250_l242_DUPLICATE_850b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_1e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l239_l234_l230_l223_l255_l250_DUPLICATE_7108_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_7f41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l239_l234_l230_l223_l250_DUPLICATE_8646_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_976b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_result_u16_value_uxn_opcodes_h_l237_c3_085b;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l240_c3_4502;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := VAR_result_u16_value_uxn_opcodes_h_l245_c3_8ab4;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l253_c21_9b49] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_9b49_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_a441_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_20ea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l243_c3_8a06] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_left;
     BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output := BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_314f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l236_c3_b410] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x <= VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output := CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_05d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_05d4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_20ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_9b49_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_b410_return_output;
     VAR_printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_314f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_20ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_20ea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l250_c7_05d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_05d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_05d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l248_c21_7104] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_7104_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_8a06_return_output);

     -- printf_uxn_opcodes_h_l224_c3_6cde[uxn_opcodes_h_l224_c3_6cde] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l224_c3_6cde_uxn_opcodes_h_l224_c3_6cde_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_7104_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_05d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l242_c7_4c41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output := result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_4c41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_81d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_81d5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output := tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_1a76] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_1a76_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output := tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l230_c7_6325] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_cond;
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output := result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_6325_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_976b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l223_c2_976b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output := result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l260_l218_DUPLICATE_8bfc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l260_l218_DUPLICATE_8bfc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_976b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_976b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l260_l218_DUPLICATE_8bfc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5fa8_uxn_opcodes_h_l260_l218_DUPLICATE_8bfc_return_output;
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
