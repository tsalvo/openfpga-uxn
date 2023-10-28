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
-- Submodules: 82
entity ldr2_0CLK_1417ec42 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_1417ec42;
architecture arch of ldr2_0CLK_1417ec42 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1731_c6_af12]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1731_c1_6250]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1731_c2_614d]
signal tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c2_614d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c2_614d]
signal t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1732_c3_9dbe[uxn_opcodes_h_l1732_c3_9dbe]
signal printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_b318]
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1736_c7_f858]
signal tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_f858]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1736_c7_f858]
signal t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1739_c11_1703]
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1739_c7_0dcc]
signal t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1742_c30_23a5]
signal sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1743_c22_ee05]
signal BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_a5c0]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_e96d]
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_7130]
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1749_c7_af20]
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_af20]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_af20]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_af20]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_af20]
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_af20]
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1751_c3_bcf9]
signal CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1752_c22_e65d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_2f05]
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_5f2c]
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1755_c22_ada4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_7c22]
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1757_c7_a5d9]
signal tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c7_a5d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c7_a5d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1757_c7_a5d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_a5d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1758_c3_48e8]
signal BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_377c]
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_f766]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_f766]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_f766]
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_f766]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1765_c31_3add]
signal CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_3651]
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_52da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_52da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_284d( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12
BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1731_c2_614d
tmp16_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d
result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d
result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c2_614d
t8_MUX_uxn_opcodes_h_l1731_c2_614d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond,
t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

-- printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe
printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe : entity work.printf_uxn_opcodes_h_l1732_c3_9dbe_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right,
BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1736_c7_f858
tmp16_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858
result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858
result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- t8_MUX_uxn_opcodes_h_l1736_c7_f858
t8_MUX_uxn_opcodes_h_l1736_c7_f858 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond,
t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue,
t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse,
t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left,
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right,
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc
tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- t8_MUX_uxn_opcodes_h_l1739_c7_0dcc
t8_MUX_uxn_opcodes_h_l1739_c7_0dcc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond,
t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue,
t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse,
t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5
sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins,
sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x,
sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y,
sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05
BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left,
BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right,
BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d
tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d
result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1749_c7_af20
tmp16_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9
CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x,
CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d
BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right,
BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c
tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4
BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9
tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond,
tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9
result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8
BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left,
BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right,
BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right,
BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1765_c31_3add
CONST_SR_8_uxn_opcodes_h_l1765_c31_3add : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x,
CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right,
BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output,
 tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output,
 tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output,
 tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output,
 sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output,
 tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output,
 CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output,
 tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output,
 tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output,
 CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_1edb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1737_c3_98af : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1743_c3_5e35 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1743_c27_38a4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_10a6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1752_c3_20d7 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1755_c3_20ec : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_90b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1761_c21_3c82_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_0ae4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1765_c21_7cb4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1755_l1752_DUPLICATE_b0bf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1750_l1758_DUPLICATE_701b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1772_l1726_DUPLICATE_249d_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_0ae4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1764_c3_0ae4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_90b7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1760_c3_90b7;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1737_c3_98af := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1737_c3_98af;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_1edb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1733_c3_1edb;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1754_c11_2f05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1739_c11_1703] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_left;
     BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output := BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1743_c27_38a4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1743_c27_38a4_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_7130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_left;
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output := BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1742_c30_23a5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_ins;
     sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_x;
     sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output := sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c6_af12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1750_l1758_DUPLICATE_701b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1750_l1758_DUPLICATE_701b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1736_c11_b318] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_left;
     BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output := BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1755_l1752_DUPLICATE_b0bf LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1755_l1752_DUPLICATE_b0bf_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_7c22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1767_c11_3651] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_left;
     BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output := BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1765_c31_3add] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output := CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_a5c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1763_c11_377c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c6_af12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1736_c11_b318_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_1703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_a5c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_7130_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1754_c11_2f05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_7c22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1763_c11_377c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1767_c11_3651_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1743_c27_38a4_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1747_l1755_l1752_DUPLICATE_b0bf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1750_l1758_DUPLICATE_701b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1750_l1758_DUPLICATE_701b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1736_l1739_l1731_DUPLICATE_1ddc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1736_l1754_l1731_DUPLICATE_e813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1736_l1763_l1757_l1754_l1749_l1745_l1739_l1767_DUPLICATE_41f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1745_l1736_l1731_DUPLICATE_f1d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_l1767_DUPLICATE_b128_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1763_l1754_l1749_l1745_l1739_DUPLICATE_3c12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1736_l1763_l1731_l1754_l1749_l1745_l1739_DUPLICATE_7ebc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1742_c30_23a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1767_c7_52da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1743_c22_ee05] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1767_c7_52da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1765_c21_7cb4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1765_c21_7cb4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1765_c31_3add_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l1751_c3_bcf9] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output := CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1763_c7_f766] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1758_c3_48e8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_left;
     BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output := BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1731_c1_6250] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1743_c3_5e35 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1743_c22_ee05_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_10a6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1752_l1747_l1755_DUPLICATE_f791_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1765_c21_7cb4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1751_c3_bcf9_return_output;
     VAR_printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1731_c1_6250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1767_c7_52da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1767_c7_52da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1743_c3_5e35;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_10a6;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c7_a5d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1752_c22_e65d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1763_c7_f766] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1757_c7_a5d9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond;
     tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output := tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;

     -- printf_uxn_opcodes_h_l1732_c3_9dbe[uxn_opcodes_h_l1732_c3_9dbe] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1732_c3_9dbe_uxn_opcodes_h_l1732_c3_9dbe_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1755_c22_ada4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1763_c7_f766] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1763_c7_f766] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output := result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;

     -- t8_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1761_c21_3c82] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1761_c21_3c82_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1758_c3_48e8_return_output);

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1752_c3_20d7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1752_c22_e65d_return_output)),16);
     VAR_result_u16_value_uxn_opcodes_h_l1755_c3_20ec := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1755_c22_ada4_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1761_c21_3c82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1763_c7_f766_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1752_c3_20d7;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1755_c3_20ec;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1757_c7_a5d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1757_c7_a5d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_a5d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1757_c7_a5d9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1754_c7_5f2c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1754_c7_5f2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_af20] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output := result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_af20_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1745_c7_e96d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1745_c7_e96d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1739_c7_0dcc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1739_c7_0dcc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1736_c7_f858] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1736_c7_f858_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c2_614d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1772_l1726_DUPLICATE_249d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1772_l1726_DUPLICATE_249d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_284d(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c2_614d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c2_614d_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1772_l1726_DUPLICATE_249d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_284d_uxn_opcodes_h_l1772_l1726_DUPLICATE_249d_return_output;
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
