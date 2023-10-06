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
-- Submodules: 125
entity lda2_0CLK_9347d63d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_9347d63d;
architecture arch of lda2_0CLK_9347d63d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2038_c6_b6bc]
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_9560]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2038_c2_7251]
signal t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2038_c2_7251]
signal tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2038_c2_7251]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2039_c3_548f[uxn_opcodes_h_l2039_c3_548f]
signal printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_edd7]
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2044_c7_4180]
signal t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2044_c7_4180]
signal tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2044_c7_4180]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_91c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2047_c7_54cb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2049_c3_0b48]
signal CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_6079]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2052_c7_5020]
signal t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2052_c7_5020]
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2052_c7_5020]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_d05f]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2055_c7_8b25]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2056_c3_50f4]
signal BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2059_c32_2bbc]
signal BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2059_c32_e749]
signal BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2059_c32_83b3]
signal MUX_uxn_opcodes_h_l2059_c32_83b3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2059_c32_83b3_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_7b92]
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_5a10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_0f54]
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2066_c7_a914]
signal tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_a914]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_f383]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_9d5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2071_c3_9310]
signal CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2072_c21_408e]
signal BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_f042]
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2074_c7_4cab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2075_c21_6c61]
signal BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_25e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_fd0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2078_c3_eceb]
signal BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_f9a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2084_c7_3cc4]
signal result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2084_c7_3cc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2084_c7_3cc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2084_c7_3cc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2086_c34_e3fa]
signal CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_1ac7]
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2088_c7_5940]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2088_c7_5940]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.ram_addr := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_opc_done := ref_toks_8;
      base.is_stack_read := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc
BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left,
BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right,
BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output);

-- t16_MUX_uxn_opcodes_h_l2038_c2_7251
t16_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2038_c2_7251
tmp16_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251
result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251
result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251
result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251
result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251
result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

-- printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f
printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f : entity work.printf_uxn_opcodes_h_l2039_c3_548f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output);

-- t16_MUX_uxn_opcodes_h_l2044_c7_4180
t16_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2044_c7_4180
tmp16_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180
result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180
result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output);

-- t16_MUX_uxn_opcodes_h_l2047_c7_54cb
t16_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb
tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb
result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb
result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48
CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x,
CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output);

-- t16_MUX_uxn_opcodes_h_l2052_c7_5020
t16_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2052_c7_5020
tmp16_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020
result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020
result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020
result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output);

-- t16_MUX_uxn_opcodes_h_l2055_c7_8b25
t16_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25
tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25
result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25
result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4
BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left,
BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right,
BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc
BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left,
BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right,
BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749
BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left,
BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right,
BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output);

-- MUX_uxn_opcodes_h_l2059_c32_83b3
MUX_uxn_opcodes_h_l2059_c32_83b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2059_c32_83b3_cond,
MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue,
MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse,
MUX_uxn_opcodes_h_l2059_c32_83b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right,
BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10
tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10
result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10
result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right,
BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2066_c7_a914
tmp16_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914
result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914
result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a
tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2071_c3_9310
CONST_SL_8_uxn_opcodes_h_l2071_c3_9310 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x,
CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e
BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left,
BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right,
BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right,
BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab
tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab
result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab
result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab
result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61
BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left,
BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right,
BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d
tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d
result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb
BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left,
BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right,
BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4
result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa
CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x,
CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right,
BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output,
 t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output,
 t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output,
 t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output,
 CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output,
 t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output,
 t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output,
 MUX_uxn_opcodes_h_l2059_c32_83b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output,
 tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output,
 tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output,
 tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output,
 CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output,
 tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output,
 CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_9a3d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_737a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_9638 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_1baa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2072_c3_6e5d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2075_c3_04d0 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_cd12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2082_c24_280b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2085_c3_2d96 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2086_c24_f7b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2048_l2056_DUPLICATE_f813_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2070_l2078_DUPLICATE_5733_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l2093_l2034_DUPLICATE_31e1_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_9a3d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2041_c3_9a3d;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right := to_unsigned(2, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_1baa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_1baa;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right := to_unsigned(128, 8);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right := to_unsigned(11, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_9638 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2050_c3_9638;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_cd12 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2081_c3_cd12;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_737a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_737a;
     VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2085_c3_2d96 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2085_c3_2d96;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right := to_unsigned(9, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2074_c11_f042] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_left;
     BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output := BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_6079] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_d05f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_91c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2038_c6_b6bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output := result.stack_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2075_c21_6c61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2086_c34_e3fa] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output := CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_f383] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2084_c11_f9a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2066_c11_0f54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_left;
     BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output := BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2072_c21_408e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_edd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2077_c11_25e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2088_c11_1ac7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2059_c32_2bbc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_left;
     BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output := BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2070_l2078_DUPLICATE_5733 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2070_l2078_DUPLICATE_5733_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2061_c11_7b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2048_l2056_DUPLICATE_f813 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2048_l2056_DUPLICATE_f813_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2059_c32_2bbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2038_c6_b6bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_edd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_91c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_6079_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_d05f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2061_c11_7b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2066_c11_0f54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_f383_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2074_c11_f042_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2077_c11_25e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2084_c11_f9a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2088_c11_1ac7_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2072_c3_6e5d := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2072_c21_408e_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l2075_c3_04d0 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2075_c21_6c61_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2048_l2056_DUPLICATE_f813_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2048_l2056_DUPLICATE_f813_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2070_l2078_DUPLICATE_5733_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2070_l2078_DUPLICATE_5733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2044_l2038_l2055_l2052_l2047_DUPLICATE_d9a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2074_l2044_l2038_l2055_l2052_l2047_DUPLICATE_3f93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2066_l2061_l2088_l2055_l2084_l2052_l2077_l2047_DUPLICATE_fd61_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2055_l2052_l2077_l2047_DUPLICATE_66ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2044_l2038_l2061_l2052_l2047_DUPLICATE_ee9a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2052_l2044_l2055_l2047_DUPLICATE_ca64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2088_l2055_l2084_l2052_l2047_DUPLICATE_3364_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2074_l2069_l2066_l2061_l2055_l2084_DUPLICATE_8fd9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2074_l2044_l2069_l2038_l2066_l2061_l2055_l2084_l2052_l2047_DUPLICATE_1610_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2072_c3_6e5d;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2075_c3_04d0;
     -- BIN_OP_OR[uxn_opcodes_h_l2056_c3_50f4] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_left;
     BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output := BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2088_c7_5940] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2049_c3_0b48] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output := CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2038_c1_9560] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2078_c3_eceb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_left;
     BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output := BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2059_c32_e749] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_left;
     BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output := BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2071_c3_9310] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output := CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2086_c24_f7b5] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2086_c24_f7b5_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2086_c34_e3fa_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2084_c7_3cc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2088_c7_5940] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2059_c32_e749_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2056_c3_50f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2086_c24_f7b5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2049_c3_0b48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2071_c3_9310_return_output;
     VAR_printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2038_c1_9560_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2088_c7_5940_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2088_c7_5940_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2082_c24_280b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2082_c24_280b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2078_c3_eceb_return_output);

     -- MUX[uxn_opcodes_h_l2059_c32_83b3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2059_c32_83b3_cond <= VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_cond;
     MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue <= VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iftrue;
     MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse <= VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_return_output := MUX_uxn_opcodes_h_l2059_c32_83b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2084_c7_3cc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;

     -- printf_uxn_opcodes_h_l2039_c3_548f[uxn_opcodes_h_l2039_c3_548f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2039_c3_548f_uxn_opcodes_h_l2039_c3_548f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2084_c7_3cc4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2084_c7_3cc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2082_c24_280b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue := VAR_MUX_uxn_opcodes_h_l2059_c32_83b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2084_c7_3cc4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2077_c7_fd0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2077_c7_fd0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2074_c7_4cab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2074_c7_4cab_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_9d5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;

     -- t16_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2069_c7_9d5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- t16_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2066_c7_a914] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2066_c7_a914_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2061_c7_5a10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2061_c7_5a10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_8b25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_8b25_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_5020] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_5020_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2047_c7_54cb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_54cb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2044_c7_4180] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output := result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_4180_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2038_c2_7251] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output := result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l2093_l2034_DUPLICATE_31e1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l2093_l2034_DUPLICATE_31e1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2038_c2_7251_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2038_c2_7251_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l2093_l2034_DUPLICATE_31e1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l2093_l2034_DUPLICATE_31e1_return_output;
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
