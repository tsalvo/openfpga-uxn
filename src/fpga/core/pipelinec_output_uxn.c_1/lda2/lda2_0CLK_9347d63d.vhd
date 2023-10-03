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
 pc : in unsigned(15 downto 0);
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
-- BIN_OP_EQ[uxn_opcodes_h_l1109_c6_f729]
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1109_c1_b7d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1109_c2_385f]
signal tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1109_c2_385f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1109_c2_385f]
signal t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1110_c3_867d[uxn_opcodes_h_l1110_c3_867d]
signal printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_06af]
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1115_c7_9a6d]
signal t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1118_c11_bab7]
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1118_c7_16a3]
signal t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1120_c3_9745]
signal CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_a7e8]
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1123_c7_9dc6]
signal t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1126_c11_38d6]
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1126_c7_77ca]
signal t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1127_c3_aedf]
signal BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1130_c32_3aff]
signal BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1130_c32_8ffd]
signal BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1130_c32_6045]
signal MUX_uxn_opcodes_h_l1130_c32_6045_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1130_c32_6045_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1130_c32_6045_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1130_c32_6045_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_3902]
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1132_c7_a082]
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1132_c7_a082]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_d55f]
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1137_c7_a11f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_fbe8]
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1140_c7_581d]
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1140_c7_581d]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1142_c3_2538]
signal CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1143_c21_99cc]
signal BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1145_c11_ad9d]
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1145_c7_c6e8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1146_c21_14b3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_9250]
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1148_c7_42ce]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1149_c3_b102]
signal BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_5bd4]
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_5b36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_5b36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_5b36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1155_c7_5b36]
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1157_c34_183d]
signal CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_687b]
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_3e49]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_3e49]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_6489( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.stack_value := ref_toks_4;
      base.is_ram_read := ref_toks_5;
      base.is_stack_read := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729
BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left,
BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right,
BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1109_c2_385f
tmp16_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f
result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f
result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f
result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f
result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- t16_MUX_uxn_opcodes_h_l1109_c2_385f
t16_MUX_uxn_opcodes_h_l1109_c2_385f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond,
t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue,
t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse,
t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

-- printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d
printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d : entity work.printf_uxn_opcodes_h_l1110_c3_867d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right,
BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d
tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d
result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- t16_MUX_uxn_opcodes_h_l1115_c7_9a6d
t16_MUX_uxn_opcodes_h_l1115_c7_9a6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond,
t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue,
t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse,
t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left,
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right,
BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3
tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3
result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3
result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3
result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- t16_MUX_uxn_opcodes_h_l1118_c7_16a3
t16_MUX_uxn_opcodes_h_l1118_c7_16a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond,
t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue,
t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse,
t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1120_c3_9745
CONST_SL_8_uxn_opcodes_h_l1120_c3_9745 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x,
CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6
tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6
result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- t16_MUX_uxn_opcodes_h_l1123_c7_9dc6
t16_MUX_uxn_opcodes_h_l1123_c7_9dc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond,
t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue,
t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse,
t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left,
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right,
BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca
tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca
result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca
result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca
result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca
result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- t16_MUX_uxn_opcodes_h_l1126_c7_77ca
t16_MUX_uxn_opcodes_h_l1126_c7_77ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond,
t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue,
t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse,
t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf
BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left,
BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right,
BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff
BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left,
BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right,
BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd
BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left,
BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right,
BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output);

-- MUX_uxn_opcodes_h_l1130_c32_6045
MUX_uxn_opcodes_h_l1130_c32_6045 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1130_c32_6045_cond,
MUX_uxn_opcodes_h_l1130_c32_6045_iftrue,
MUX_uxn_opcodes_h_l1130_c32_6045_iffalse,
MUX_uxn_opcodes_h_l1130_c32_6045_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right,
BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1132_c7_a082
tmp16_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082
result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082
result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082
result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right,
BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f
tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f
result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f
result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f
result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right,
BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1140_c7_581d
tmp16_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d
result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d
result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1142_c3_2538
CONST_SL_8_uxn_opcodes_h_l1142_c3_2538 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x,
CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc
BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left,
BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right,
BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left,
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right,
BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8
tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8
result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3
BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right,
BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce
tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce
result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce
result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce
result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102
BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left,
BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right,
BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right,
BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1157_c34_183d
CONST_SR_8_uxn_opcodes_h_l1157_c34_183d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x,
CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right,
BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output);



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
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output,
 tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output,
 CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output,
 MUX_uxn_opcodes_h_l1130_c32_6045_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output,
 tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output,
 tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output,
 tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output,
 CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1112_c3_f6b0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_a440 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_a16c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_82bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1130_c32_6045_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1130_c32_6045_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1143_c3_9412 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1146_c3_f4d5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_479f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1153_c24_7f5a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1156_c3_1a47 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1157_c24_9c15_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1119_l1127_DUPLICATE_975d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1149_l1141_DUPLICATE_da23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6489_uxn_opcodes_h_l1164_l1105_DUPLICATE_0402_return_output : opcode_result_t;
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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1112_c3_f6b0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1112_c3_f6b0;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_82bd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1124_c3_82bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right := to_unsigned(3, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_a16c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1121_c3_a16c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right := to_unsigned(11, 4);
     VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1156_c3_1a47 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1156_c3_1a47;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_479f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1152_c3_479f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right := to_unsigned(8, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_a440 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1116_c3_a440;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1115_c11_06af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1145_c11_ad9d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1159_c11_687b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output := result.is_ram_read;

     -- CONST_SR_8[uxn_opcodes_h_l1157_c34_183d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output := CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1155_c11_5bd4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1140_c11_fbe8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1149_l1141_DUPLICATE_da23 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1149_l1141_DUPLICATE_da23_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1137_c11_d55f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1146_c21_14b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1126_c11_38d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1132_c11_3902] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_left;
     BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output := BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1148_c11_9250] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_left;
     BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output := BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1130_c32_3aff] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_left;
     BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output := BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1119_l1127_DUPLICATE_975d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1119_l1127_DUPLICATE_975d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1109_c6_f729] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_left;
     BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output := BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_a7e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1118_c11_bab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1143_c21_99cc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1130_c32_3aff_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1109_c6_f729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1115_c11_06af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1118_c11_bab7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_a7e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1126_c11_38d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1132_c11_3902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1137_c11_d55f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1140_c11_fbe8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1145_c11_ad9d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1148_c11_9250_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1155_c11_5bd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1159_c11_687b_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1143_c3_9412 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1143_c21_99cc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1146_c3_f4d5 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1146_c21_14b3_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1119_l1127_DUPLICATE_975d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1119_l1127_DUPLICATE_975d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1149_l1141_DUPLICATE_da23_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1149_l1141_DUPLICATE_da23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1126_l1109_l1123_l1115_l1118_DUPLICATE_59bf_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e519_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1148_l1126_l1132_l1145_l1159_l1123_l1115_l1118_DUPLICATE_3fc5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1140_l1137_l1148_l1126_l1145_l1109_l1123_l1115_l1118_DUPLICATE_e35f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1132_l1109_l1123_l1115_l1118_DUPLICATE_3c94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1115_l1123_l1118_l1126_DUPLICATE_e445_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1159_l1115_l1118_DUPLICATE_b300_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_DUPLICATE_bd1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1155_l1140_l1137_l1126_l1132_l1145_l1109_l1123_l1115_l1118_DUPLICATE_26be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1143_c3_9412;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1146_c3_f4d5;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1155_c7_5b36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1130_c32_8ffd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_left;
     BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output := BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1120_c3_9745] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output := CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1159_c7_3e49] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1109_c1_b7d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1149_c3_b102] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_left;
     BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output := BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1127_c3_aedf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_left;
     BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output := BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1159_c7_3e49] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1142_c3_2538] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output := CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1157_c24_9c15] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1157_c24_9c15_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1157_c34_183d_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1130_c32_6045_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1130_c32_8ffd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1127_c3_aedf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1157_c24_9c15_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1120_c3_9745_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1142_c3_2538_return_output;
     VAR_printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1109_c1_b7d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1159_c7_3e49_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1155_c7_5b36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;

     -- MUX[uxn_opcodes_h_l1130_c32_6045] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1130_c32_6045_cond <= VAR_MUX_uxn_opcodes_h_l1130_c32_6045_cond;
     MUX_uxn_opcodes_h_l1130_c32_6045_iftrue <= VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iftrue;
     MUX_uxn_opcodes_h_l1130_c32_6045_iffalse <= VAR_MUX_uxn_opcodes_h_l1130_c32_6045_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1130_c32_6045_return_output := MUX_uxn_opcodes_h_l1130_c32_6045_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1155_c7_5b36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;

     -- t16_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1155_c7_5b36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output := result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;

     -- printf_uxn_opcodes_h_l1110_c3_867d[uxn_opcodes_h_l1110_c3_867d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1110_c3_867d_uxn_opcodes_h_l1110_c3_867d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1153_c24_7f5a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1153_c24_7f5a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1149_c3_b102_return_output);

     -- result_ram_addr_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1153_c24_7f5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue := VAR_MUX_uxn_opcodes_h_l1130_c32_6045_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1155_c7_5b36_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- t16_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1148_c7_42ce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1148_c7_42ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1145_c7_c6e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1145_c7_c6e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1140_c7_581d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- t16_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1140_c7_581d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- t16_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1137_c7_a11f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1137_c7_a11f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1132_c7_a082] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output := result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1132_c7_a082_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1126_c7_77ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1126_c7_77ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_9dc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1123_c7_9dc6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1118_c7_16a3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1118_c7_16a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1115_c7_9a6d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1115_c7_9a6d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1109_c2_385f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6489_uxn_opcodes_h_l1164_l1105_DUPLICATE_0402 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6489_uxn_opcodes_h_l1164_l1105_DUPLICATE_0402_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6489(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1109_c2_385f_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1109_c2_385f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6489_uxn_opcodes_h_l1164_l1105_DUPLICATE_0402_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6489_uxn_opcodes_h_l1164_l1105_DUPLICATE_0402_return_output;
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
