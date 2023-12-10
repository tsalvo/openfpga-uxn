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
-- Submodules: 66
entity ldz2_0CLK_85b07dec is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_85b07dec;
architecture arch of ldz2_0CLK_85b07dec is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1447_c6_adc2]
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1447_c2_7cd8]
signal t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_a25c]
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1454_c7_3140]
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_3140]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1454_c7_3140]
signal t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1457_c11_b9bd]
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1457_c7_d9b0]
signal t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1460_c30_8264]
signal sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1463_c11_4639]
signal BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1463_c7_a9cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1465_c33_3052]
signal BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_417a]
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1467_c7_fdb6]
signal tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_fdb6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1467_c7_fdb6]
signal result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_fdb6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_fdb6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1469_c3_73d4]
signal CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_613f]
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1471_c7_e823]
signal tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_e823]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1471_c7_e823]
signal result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_e823]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_e823]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1472_c3_5a99]
signal BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_e2d5]
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_63e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1477_c7_63e6]
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_63e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_63e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1479_c31_9de9]
signal CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_6d7b]
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_036f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_036f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e78e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2
BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left,
BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right,
BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8
tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- t8_MUX_uxn_opcodes_h_l1447_c2_7cd8
t8_MUX_uxn_opcodes_h_l1447_c2_7cd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond,
t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue,
t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse,
t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right,
BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1454_c7_3140
tmp16_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140
result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140
result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- t8_MUX_uxn_opcodes_h_l1454_c7_3140
t8_MUX_uxn_opcodes_h_l1454_c7_3140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond,
t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue,
t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse,
t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left,
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right,
BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0
tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- t8_MUX_uxn_opcodes_h_l1457_c7_d9b0
t8_MUX_uxn_opcodes_h_l1457_c7_d9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond,
t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue,
t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse,
t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1460_c30_8264
sp_relative_shift_uxn_opcodes_h_l1460_c30_8264 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins,
sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x,
sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y,
sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639
BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left,
BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right,
BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc
tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052
BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left,
BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right,
BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right,
BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6
tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond,
tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6
result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4
CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x,
CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right,
BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1471_c7_e823
tmp16_MUX_uxn_opcodes_h_l1471_c7_e823 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond,
tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue,
tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse,
tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823
result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond,
result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99
BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left,
BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right,
BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right,
BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6
result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9
CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x,
CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output,
 sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output,
 tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output,
 CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1451_c3_8900 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_9b98 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1461_c22_1f96_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1464_c3_a0ae : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1465_c22_88f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_5409 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1475_c21_b9aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_dac0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1479_c21_fd4a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1468_l1472_DUPLICATE_9fcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1486_l1442_DUPLICATE_a03b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1464_c3_a0ae := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1464_c3_a0ae;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1451_c3_8900 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1451_c3_8900;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_5409 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_5409;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_dac0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1478_c3_dac0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_9b98 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1455_c3_9b98;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse := tmp16;
     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1465_c33_3052] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1477_c11_e2d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1479_c31_9de9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output := CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1447_c6_adc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1463_c11_4639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_left;
     BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output := BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1471_c11_613f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1454_c11_a25c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1468_l1472_DUPLICATE_9fcb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1468_l1472_DUPLICATE_9fcb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1461_c22_1f96] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1461_c22_1f96_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_6d7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1467_c11_417a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1457_c11_b9bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1460_c30_8264] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_ins;
     sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_x;
     sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output := sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1447_c6_adc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1454_c11_a25c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1457_c11_b9bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1463_c11_4639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1467_c11_417a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1471_c11_613f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1477_c11_e2d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_6d7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1461_c22_1f96_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1468_l1472_DUPLICATE_9fcb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1468_l1472_DUPLICATE_9fcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_e57f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1447_l1463_l1454_DUPLICATE_b0b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1481_l1477_l1471_l1467_l1463_l1457_l1454_DUPLICATE_f34d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1481_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_2f5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1457_l1463_l1477_l1467_DUPLICATE_d898_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1447_l1477_l1467_l1463_l1457_l1454_DUPLICATE_5934_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1460_c30_8264_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1479_c21_fd4a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1479_c21_fd4a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1479_c31_9de9_return_output);

     -- t8_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1472_c3_5a99] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_left;
     BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output := BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1469_c3_73d4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output := CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_036f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1465_c22_88f8] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1465_c22_88f8_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1465_c33_3052_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1477_c7_63e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_036f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1465_c22_88f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1479_c21_fd4a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1469_c3_73d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_036f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_036f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1471_c7_e823] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1477_c7_63e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1475_c21_b9aa] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1475_c21_b9aa_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1472_c3_5a99_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l1471_c7_e823] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_cond;
     tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output := tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1477_c7_63e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1477_c7_63e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1475_c21_b9aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1477_c7_63e6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1467_c7_fdb6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1467_c7_fdb6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond;
     tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output := tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1471_c7_e823] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;

     -- t8_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1471_c7_e823] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1471_c7_e823] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output := result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1471_c7_e823_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1467_c7_fdb6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1467_c7_fdb6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1467_c7_fdb6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1467_c7_fdb6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1463_c7_a9cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1463_c7_a9cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1457_c7_d9b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1457_c7_d9b0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1454_c7_3140] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1454_c7_3140_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1447_c2_7cd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1486_l1442_DUPLICATE_a03b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1486_l1442_DUPLICATE_a03b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e78e(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1447_c2_7cd8_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1486_l1442_DUPLICATE_a03b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e78e_uxn_opcodes_h_l1486_l1442_DUPLICATE_a03b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
