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
-- Submodules: 88
entity ovr2_0CLK_c46bbc82 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr2_0CLK_c46bbc82;
architecture arch of ovr2_0CLK_c46bbc82 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l324_c6_f78c]
signal BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l324_c1_a2a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l324_c2_e8e3]
signal t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l325_c3_471a[uxn_opcodes_h_l325_c3_471a]
signal printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_9892]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l329_c7_89fd]
signal n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l329_c7_89fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l329_c7_89fd]
signal t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l332_c11_9132]
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l332_c7_39e4]
signal n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l332_c7_39e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l332_c7_39e4]
signal t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l337_c11_e4df]
signal BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l337_c7_447d]
signal n16_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l337_c7_447d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l337_c7_447d]
signal t16_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l338_c3_d684]
signal BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l341_c11_320b]
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_7bd1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l345_c30_f356]
signal sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l350_c11_5010]
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_3ce4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l351_c3_0132]
signal BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l354_c31_d660]
signal CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l356_c11_7e55]
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_0087]
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_0087]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_0087]
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l356_c7_0087]
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l360_c11_7c2d]
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_d33a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_d33a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_d33a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l360_c7_d33a]
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l364_c11_f70c]
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_47e6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_47e6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_47e6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l364_c7_47e6]
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4edb]
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_5952]
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_5952]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_5952]
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l368_c7_5952]
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l372_c11_17a8]
signal BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l372_c7_ca6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l372_c7_ca6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output : unsigned(15 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c551( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c
BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left,
BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right,
BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output);

-- n16_MUX_uxn_opcodes_h_l324_c2_e8e3
n16_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3
result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3
result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3
result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3
result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- t16_MUX_uxn_opcodes_h_l324_c2_e8e3
t16_MUX_uxn_opcodes_h_l324_c2_e8e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond,
t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue,
t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse,
t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

-- printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a
printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a : entity work.printf_uxn_opcodes_h_l325_c3_471a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output);

-- n16_MUX_uxn_opcodes_h_l329_c7_89fd
n16_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd
result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- t16_MUX_uxn_opcodes_h_l329_c7_89fd
t16_MUX_uxn_opcodes_h_l329_c7_89fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond,
t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue,
t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse,
t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132
BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right,
BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output);

-- n16_MUX_uxn_opcodes_h_l332_c7_39e4
n16_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4
result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- t16_MUX_uxn_opcodes_h_l332_c7_39e4
t16_MUX_uxn_opcodes_h_l332_c7_39e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond,
t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue,
t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse,
t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df
BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left,
BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right,
BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output);

-- n16_MUX_uxn_opcodes_h_l337_c7_447d
n16_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l337_c7_447d_cond,
n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d
result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d
result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d
result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d
result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- t16_MUX_uxn_opcodes_h_l337_c7_447d
t16_MUX_uxn_opcodes_h_l337_c7_447d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l337_c7_447d_cond,
t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue,
t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse,
t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l338_c3_d684
BIN_OP_OR_uxn_opcodes_h_l338_c3_d684 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left,
BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right,
BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b
BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right,
BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output);

-- n16_MUX_uxn_opcodes_h_l341_c7_7bd1
n16_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1
result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l345_c30_f356
sp_relative_shift_uxn_opcodes_h_l345_c30_f356 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins,
sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x,
sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y,
sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010
BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right,
BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output);

-- n16_MUX_uxn_opcodes_h_l350_c7_3ce4
n16_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l351_c3_0132
BIN_OP_OR_uxn_opcodes_h_l351_c3_0132 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left,
BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right,
BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output);

-- CONST_SR_8_uxn_opcodes_h_l354_c31_d660
CONST_SR_8_uxn_opcodes_h_l354_c31_d660 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x,
CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55
BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right,
BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087
result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d
BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right,
BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a
result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c
BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right,
BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6
result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right,
BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8
BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left,
BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right,
BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f
result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f
result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a
CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce
CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output,
 n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output,
 n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output,
 n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output,
 n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output,
 n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output,
 sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output,
 n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output,
 CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_8eef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ee7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l335_c3_9a28 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_b84e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l348_c21_40bf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_df83 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l354_c21_003b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1db1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_af79 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l365_c3_4548 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_e9c7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l368_c7_5952_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l358_l366_DUPLICATE_050f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_6ef9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l320_l377_DUPLICATE_f4a7_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l335_c3_9a28 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l335_c3_9a28;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_e9c7 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l369_c3_e9c7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_df83 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l353_c3_df83;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l365_c3_4548 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l365_c3_4548;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4dc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l339_c3_c4dc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1db1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l357_c3_1db1;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_b84e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l347_c3_b84e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ee7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ee7f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_af79 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l361_c3_af79;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_8eef := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_8eef;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left := n16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l364_c11_f70c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_left;
     BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output := BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l348_c21_40bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l348_c21_40bf_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l356_c11_7e55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_left;
     BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output := BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l332_c11_9132] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_left;
     BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output := BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l341_c11_320b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_left;
     BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output := BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l368_c11_4edb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_left;
     BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output := BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l358_l366_DUPLICATE_050f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l358_l366_DUPLICATE_050f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_9892] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l368_c7_5952] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l368_c7_5952_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l360_c11_7c2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l372_c11_17a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l354_c31_d660] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x <= VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output := CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l345_c30_f356] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_ins;
     sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x <= VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_x;
     sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y <= VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output := sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l324_c6_f78c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_left;
     BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output := BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l337_c11_e4df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_left;
     BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output := BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l350_c11_5010] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_left;
     BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output := BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c6_f78c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_9892_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l332_c11_9132_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l337_c11_e4df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l341_c11_320b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l350_c11_5010_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l356_c11_7e55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l360_c11_7c2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l364_c11_f70c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l368_c11_4edb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l372_c11_17a8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l338_l342_l333_l351_DUPLICATE_953c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l348_c21_40bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l358_l366_DUPLICATE_050f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l358_l366_DUPLICATE_050f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l329_l324_l341_l337_l332_DUPLICATE_0d1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l329_l360_l356_l350_l341_l372_l337_l368_l332_l364_DUPLICATE_606c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l329_l324_l350_l337_l332_DUPLICATE_7154_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l329_l360_l324_l356_l350_l372_l337_l368_l332_l364_DUPLICATE_a5c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l329_l324_l337_l368_l332_DUPLICATE_b651_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l368_c7_5952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l345_c30_f356_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l372_c7_ca6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l368_c7_5952] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l338_c3_d684] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_left;
     BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output := BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l351_c3_0132] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_left;
     BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output := BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l372_c7_ca6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l354_c21_003b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l354_c21_003b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l354_c31_d660_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l324_c1_a2a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_6ef9 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_6ef9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_d7ce_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l338_c3_d684_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l351_c3_0132_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l354_c21_003b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_6ef9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l370_l362_DUPLICATE_6ef9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l343_l334_DUPLICATE_9e6a_return_output;
     VAR_printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l324_c1_a2a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l372_c7_ca6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l368_c7_5952_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l364_c7_47e6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l368_c7_5952] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l368_c7_5952] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output;

     -- n16_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- t16_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output := t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l368_c7_5952] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_cond;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output := result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output;

     -- printf_uxn_opcodes_h_l325_c3_471a[uxn_opcodes_h_l325_c3_471a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l325_c3_471a_uxn_opcodes_h_l325_c3_471a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l368_c7_5952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l368_c7_5952_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l368_c7_5952_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l364_c7_47e6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l360_c7_d33a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l364_c7_47e6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l364_c7_47e6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output := result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;

     -- n16_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- t16_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l364_c7_47e6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l360_c7_d33a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output := result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l356_c7_0087] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output;

     -- n16_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output := n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l360_c7_d33a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;

     -- t16_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l360_c7_d33a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l356_c7_0087_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l360_c7_d33a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l356_c7_0087] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output;

     -- n16_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l356_c7_0087] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output;

     -- t16_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l356_c7_0087] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_cond;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output := result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l356_c7_0087_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l356_c7_0087_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l356_c7_0087_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;
     -- n16_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l350_c7_3ce4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output := result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l350_c7_3ce4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- n16_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l341_c7_7bd1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output := result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l341_c7_7bd1_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l337_c7_447d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l337_c7_447d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l332_c7_39e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l332_c7_39e4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_89fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_89fd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l324_c2_e8e3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output := result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l320_l377_DUPLICATE_f4a7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l320_l377_DUPLICATE_f4a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c551(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c2_e8e3_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l320_l377_DUPLICATE_f4a7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c551_uxn_opcodes_h_l320_l377_DUPLICATE_f4a7_return_output;
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
