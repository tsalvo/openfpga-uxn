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
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2458_c6_1d6c]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2458_c1_7622]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2458_c2_3622]
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2458_c2_3622]
signal t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2459_c3_f8c9[uxn_opcodes_h_l2459_c3_f8c9]
signal printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_dd65]
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2464_c7_6800]
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2464_c7_6800]
signal t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_3f5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2467_c7_70a9]
signal t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2469_c3_577d]
signal CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_fdb6]
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2472_c7_64fd]
signal t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2475_c11_6855]
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2475_c7_2198]
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2475_c7_2198]
signal t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2476_c3_1593]
signal BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2479_c32_6301]
signal BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2479_c32_9ecb]
signal BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2479_c32_6e27]
signal MUX_uxn_opcodes_h_l2479_c32_6e27_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2479_c32_6e27_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_405e]
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c7_7e11]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_7e11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_7e11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_7e11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2481_c7_7e11]
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_f786]
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_9493]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_9493]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2487_c7_9493]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2487_c7_9493]
signal result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2489_c34_def1]
signal CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_3994]
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_8882]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_8882]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c
BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622
result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- t16_MUX_uxn_opcodes_h_l2458_c2_3622
t16_MUX_uxn_opcodes_h_l2458_c2_3622 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond,
t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue,
t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse,
t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

-- printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9
printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9 : entity work.printf_uxn_opcodes_h_l2459_c3_f8c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right,
BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800
result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- t16_MUX_uxn_opcodes_h_l2464_c7_6800
t16_MUX_uxn_opcodes_h_l2464_c7_6800 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond,
t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue,
t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse,
t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9
result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- t16_MUX_uxn_opcodes_h_l2467_c7_70a9
t16_MUX_uxn_opcodes_h_l2467_c7_70a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond,
t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue,
t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse,
t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2469_c3_577d
CONST_SL_8_uxn_opcodes_h_l2469_c3_577d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x,
CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right,
BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd
result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- t16_MUX_uxn_opcodes_h_l2472_c7_64fd
t16_MUX_uxn_opcodes_h_l2472_c7_64fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond,
t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue,
t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse,
t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855
BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left,
BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right,
BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198
result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- t16_MUX_uxn_opcodes_h_l2475_c7_2198
t16_MUX_uxn_opcodes_h_l2475_c7_2198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond,
t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue,
t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse,
t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593
BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left,
BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right,
BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301
BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left,
BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right,
BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb
BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left,
BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right,
BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output);

-- MUX_uxn_opcodes_h_l2479_c32_6e27
MUX_uxn_opcodes_h_l2479_c32_6e27 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2479_c32_6e27_cond,
MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue,
MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse,
MUX_uxn_opcodes_h_l2479_c32_6e27_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right,
BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right,
BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493
result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond,
result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2489_c34_def1
CONST_SR_8_uxn_opcodes_h_l2489_c34_def1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x,
CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right,
BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output,
 CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output,
 MUX_uxn_opcodes_h_l2479_c32_6e27_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output,
 CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7afb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6b37 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2470_c3_e284 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_007b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_21e4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_1464_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_19c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c24_0790_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2476_l2468_DUPLICATE_5620_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2487_l2475_DUPLICATE_a208_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2496_l2454_DUPLICATE_7918_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_007b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2473_c3_007b;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6b37 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6b37;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_19c8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2488_c3_19c8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7afb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_7afb;
     VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_21e4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2484_c3_21e4;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2470_c3_e284 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2470_c3_e284;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2487_c11_f786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_left;
     BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output := BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2491_c11_3994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_left;
     BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output := BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_3f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2479_c32_6301] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_left;
     BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output := BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2475_c11_6855] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_left;
     BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output := BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2481_c11_405e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2487_l2475_DUPLICATE_a208 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2487_l2475_DUPLICATE_a208_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2464_c11_dd65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2476_l2468_DUPLICATE_5620 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2476_l2468_DUPLICATE_5620_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l2489_c34_def1] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output := CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c6_1d6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2472_c11_fdb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2485_c24_1464] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_1464_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2479_c32_6301_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c6_1d6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2464_c11_dd65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_3f5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2472_c11_fdb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2475_c11_6855_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c11_405e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2487_c11_f786_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2491_c11_3994_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2476_l2468_DUPLICATE_5620_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2476_l2468_DUPLICATE_5620_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2485_c24_1464_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2475_DUPLICATE_ab2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2487_l2481_l2475_DUPLICATE_2689_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2481_DUPLICATE_800c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2467_l2472_l2464_l2475_DUPLICATE_cd98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2491_l2458_l2487_l2475_DUPLICATE_bd29_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2487_l2475_DUPLICATE_a208_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2487_l2475_DUPLICATE_a208_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2472_l2467_l2464_l2458_l2487_l2475_DUPLICATE_98f6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2487_c7_9493] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2491_c7_8882] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2476_c3_1593] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_left;
     BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output := BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2458_c1_7622] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c7_7e11] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2491_c7_8882] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2479_c32_9ecb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_left;
     BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output := BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2489_c24_0790] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c24_0790_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2489_c34_def1_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2469_c3_577d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output := CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2479_c32_9ecb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2476_c3_1593_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2489_c24_0790_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2469_c3_577d_return_output;
     VAR_printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2458_c1_7622_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2491_c7_8882_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2491_c7_8882_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2487_c7_9493] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2487_c7_9493] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- MUX[uxn_opcodes_h_l2479_c32_6e27] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2479_c32_6e27_cond <= VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_cond;
     MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue <= VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iftrue;
     MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse <= VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_return_output := MUX_uxn_opcodes_h_l2479_c32_6e27_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- t16_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c7_7e11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2487_c7_9493] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output := result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;

     -- printf_uxn_opcodes_h_l2459_c3_f8c9[uxn_opcodes_h_l2459_c3_f8c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2459_c3_f8c9_uxn_opcodes_h_l2459_c3_f8c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue := VAR_MUX_uxn_opcodes_h_l2479_c32_6e27_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2487_c7_9493_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     -- t16_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2481_c7_7e11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output := result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2481_c7_7e11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c7_7e11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2481_c7_7e11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2475_c7_2198] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output := result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;

     -- t16_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2475_c7_2198_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- t16_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2472_c7_64fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2472_c7_64fd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     -- t16_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2467_c7_70a9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2467_c7_70a9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2464_c7_6800] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2464_c7_6800_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c2_3622] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2496_l2454_DUPLICATE_7918 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2496_l2454_DUPLICATE_7918_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c2_3622_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2458_c2_3622_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2496_l2454_DUPLICATE_7918_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2496_l2454_DUPLICATE_7918_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
