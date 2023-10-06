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
entity mul_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end mul_0CLK_fd2391e7;
architecture arch of mul_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2292_c6_0d03]
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2292_c1_f439]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2292_c2_59d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2293_c3_e276[uxn_opcodes_h_l2293_c3_e276]
signal printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_44af]
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2298_c7_25e2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_c8af]
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2301_c7_d260]
signal t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2301_c7_d260]
signal n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2301_c7_d260]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_d792]
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2305_c7_8e62]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_9afa]
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2308_c7_1566]
signal n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_1566]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2312_c32_ad61]
signal BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2312_c32_049b]
signal BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2312_c32_84dd]
signal MUX_uxn_opcodes_h_l2312_c32_84dd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2312_c32_84dd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2314_c11_c322]
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2314_c7_d685]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2314_c7_d685]
signal result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2314_c7_d685]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2314_c7_d685]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2314_c7_d685]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2318_c24_6d64]
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right : unsigned(7 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_8ddc]
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_f0b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_f0b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03
BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left,
BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right,
BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output);

-- t8_MUX_uxn_opcodes_h_l2292_c2_59d9
t8_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- n8_MUX_uxn_opcodes_h_l2292_c2_59d9
n8_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9
result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

-- printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276
printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276 : entity work.printf_uxn_opcodes_h_l2293_c3_e276_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right,
BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output);

-- t8_MUX_uxn_opcodes_h_l2298_c7_25e2
t8_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- n8_MUX_uxn_opcodes_h_l2298_c7_25e2
n8_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2
result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right,
BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output);

-- t8_MUX_uxn_opcodes_h_l2301_c7_d260
t8_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- n8_MUX_uxn_opcodes_h_l2301_c7_d260
n8_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right,
BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output);

-- n8_MUX_uxn_opcodes_h_l2305_c7_8e62
n8_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right,
BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output);

-- n8_MUX_uxn_opcodes_h_l2308_c7_1566
n8_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61
BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left,
BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right,
BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b
BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left,
BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right,
BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output);

-- MUX_uxn_opcodes_h_l2312_c32_84dd
MUX_uxn_opcodes_h_l2312_c32_84dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2312_c32_84dd_cond,
MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue,
MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse,
MUX_uxn_opcodes_h_l2312_c32_84dd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left,
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right,
BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685
result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685
result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond,
result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output);

-- BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64 : entity work.BIN_OP_INFERRED_MULT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right,
BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right,
BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output,
 t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output,
 t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output,
 t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output,
 n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output,
 n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output,
 MUX_uxn_opcodes_h_l2312_c32_84dd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output,
 BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_6051 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_1cae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_91bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_5692 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l2318_c3_53e3 : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_1546 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2314_DUPLICATE_e958_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2325_l2288_DUPLICATE_babc_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_5692 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2306_c3_5692;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_1cae := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2299_c3_1cae;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_91bd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2303_c3_91bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_1546 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2317_c3_1546;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_6051 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2295_c3_6051;
     VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left := VAR_ins;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2305_c11_d792] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_left;
     BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output := BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2320_c11_8ddc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2301_c11_c8af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2314_DUPLICATE_e958 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2314_DUPLICATE_e958_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2308_c11_9afa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2312_c32_ad61] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_left;
     BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output := BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2298_c11_44af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_left;
     BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output := BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2314_c11_c322] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_left;
     BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output := BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_opcodes_h_l2318_c24_6d64] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_left;
     BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right <= VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output := BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2292_c6_0d03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2312_c32_ad61_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c6_0d03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2298_c11_44af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2301_c11_c8af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2305_c11_d792_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2308_c11_9afa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2314_c11_c322_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2320_c11_8ddc_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l2318_c3_53e3 := resize(VAR_BIN_OP_INFERRED_MULT_uxn_opcodes_h_l2318_c24_6d64_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2292_l2308_l2305_l2301_l2298_DUPLICATE_9ba6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2320_l2314_l2308_l2305_l2301_l2298_DUPLICATE_4a1a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2292_l2314_l2305_l2301_l2298_DUPLICATE_4492_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2308_l2301_l2305_l2298_DUPLICATE_3989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2292_l2320_l2308_l2305_l2301_l2298_DUPLICATE_a2a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2314_DUPLICATE_e958_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2308_l2314_DUPLICATE_e958_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2292_l2314_l2308_l2305_l2301_l2298_DUPLICATE_2f3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue := VAR_result_stack_value_uxn_opcodes_h_l2318_c3_53e3;
     -- t8_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2312_c32_049b] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_left;
     BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output := BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2320_c7_f0b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2314_c7_d685] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2292_c1_f439] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2314_c7_d685] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output := result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2320_c7_f0b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2314_c7_d685] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;

     -- n8_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2312_c32_049b_return_output;
     VAR_printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2292_c1_f439_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2320_c7_f0b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2314_c7_d685] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;

     -- printf_uxn_opcodes_h_l2293_c3_e276[uxn_opcodes_h_l2293_c3_e276] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2293_c3_e276_uxn_opcodes_h_l2293_c3_e276_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- MUX[uxn_opcodes_h_l2312_c32_84dd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2312_c32_84dd_cond <= VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_cond;
     MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue <= VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iftrue;
     MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse <= VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_return_output := MUX_uxn_opcodes_h_l2312_c32_84dd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2314_c7_d685] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue := VAR_MUX_uxn_opcodes_h_l2312_c32_84dd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2314_c7_d685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- t8_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2308_c7_1566] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- n8_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2308_c7_1566_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2305_c7_8e62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- n8_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2305_c7_8e62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- n8_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2301_c7_d260] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2301_c7_d260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2298_c7_25e2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2298_c7_25e2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c2_59d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2325_l2288_DUPLICATE_babc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2325_l2288_DUPLICATE_babc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2292_c2_59d9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2325_l2288_DUPLICATE_babc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2325_l2288_DUPLICATE_babc_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
