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
-- Submodules: 185
entity rot2_0CLK_79985188 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_79985188;
architecture arch of rot2_0CLK_79985188 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_076c]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c1_66c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1867_c2_4a4c]
signal n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1868_c3_8942[uxn_opcodes_h_l1868_c3_8942]
signal printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_d504]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_00c0]
signal n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_b21c]
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1876_c7_518b]
signal l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1876_c7_518b]
signal result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1876_c7_518b]
signal t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1876_c7_518b]
signal n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_c50d]
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1881_c7_18bc]
signal n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_e29d]
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1884_c7_1b85]
signal n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1885_c3_4d89]
signal BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_002e]
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1888_c7_6007]
signal l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1888_c7_6007]
signal result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1888_c7_6007]
signal n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_8398]
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1891_c7_1431]
signal l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1891_c7_1431]
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1891_c7_1431]
signal n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_274e]
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1896_c7_2b4b]
signal n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_2dca]
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1899_c7_5404]
signal l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_5404]
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1899_c7_5404]
signal n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1900_c3_5251]
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_2341]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1903_c7_2af5]
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_6288]
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1906_c7_3e68]
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_9352]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1911_c7_837b]
signal l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_837b]
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_f480]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l1914_c7_be71]
signal l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1914_c7_be71]
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1915_c3_b62f]
signal BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1918_c32_0f69]
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1918_c32_aeb8]
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1918_c32_c6b6]
signal MUX_uxn_opcodes_h_l1918_c32_c6b6_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_d952]
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_07ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_07ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_07ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_07ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_07ba]
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_9564]
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_3d6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_3d6a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_3d6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_3d6a]
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1928_c34_3d9a]
signal CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_c72b]
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_c473]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_c473]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_c473]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_c473]
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_d931]
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_c53f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_c53f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_c53f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_c53f]
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1936_c34_6414]
signal CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_89f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_aef3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_aef3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_aef3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_aef3]
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1942_c11_9436]
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1942_c7_af04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c7_af04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c7_af04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1942_c7_af04]
signal result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1944_c34_c94a]
signal CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_83b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_d784]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_d784]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output);

-- l16_MUX_uxn_opcodes_h_l1867_c2_4a4c
l16_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c
result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- t16_MUX_uxn_opcodes_h_l1867_c2_4a4c
t16_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- n16_MUX_uxn_opcodes_h_l1867_c2_4a4c
n16_MUX_uxn_opcodes_h_l1867_c2_4a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond,
n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue,
n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse,
n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

-- printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942
printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942 : entity work.printf_uxn_opcodes_h_l1868_c3_8942_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output);

-- l16_MUX_uxn_opcodes_h_l1873_c7_00c0
l16_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- t16_MUX_uxn_opcodes_h_l1873_c7_00c0
t16_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_00c0
n16_MUX_uxn_opcodes_h_l1873_c7_00c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right,
BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output);

-- l16_MUX_uxn_opcodes_h_l1876_c7_518b
l16_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b
result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b
result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- t16_MUX_uxn_opcodes_h_l1876_c7_518b
t16_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- n16_MUX_uxn_opcodes_h_l1876_c7_518b
n16_MUX_uxn_opcodes_h_l1876_c7_518b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond,
n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue,
n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse,
n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right,
BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output);

-- l16_MUX_uxn_opcodes_h_l1881_c7_18bc
l16_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc
result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc
result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- t16_MUX_uxn_opcodes_h_l1881_c7_18bc
t16_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1881_c7_18bc
n16_MUX_uxn_opcodes_h_l1881_c7_18bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond,
n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue,
n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse,
n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right,
BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output);

-- l16_MUX_uxn_opcodes_h_l1884_c7_1b85
l16_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85
result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85
result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85
result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85
result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- t16_MUX_uxn_opcodes_h_l1884_c7_1b85
t16_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- n16_MUX_uxn_opcodes_h_l1884_c7_1b85
n16_MUX_uxn_opcodes_h_l1884_c7_1b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond,
n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue,
n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse,
n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89
BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left,
BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right,
BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right,
BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output);

-- l16_MUX_uxn_opcodes_h_l1888_c7_6007
l16_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007
result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007
result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007
result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- n16_MUX_uxn_opcodes_h_l1888_c7_6007
n16_MUX_uxn_opcodes_h_l1888_c7_6007 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond,
n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue,
n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse,
n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right,
BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output);

-- l16_MUX_uxn_opcodes_h_l1891_c7_1431
l16_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431
result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- n16_MUX_uxn_opcodes_h_l1891_c7_1431
n16_MUX_uxn_opcodes_h_l1891_c7_1431 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond,
n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue,
n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse,
n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right,
BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output);

-- l16_MUX_uxn_opcodes_h_l1896_c7_2b4b
l16_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b
result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- n16_MUX_uxn_opcodes_h_l1896_c7_2b4b
n16_MUX_uxn_opcodes_h_l1896_c7_2b4b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond,
n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue,
n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse,
n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right,
BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output);

-- l16_MUX_uxn_opcodes_h_l1899_c7_5404
l16_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- n16_MUX_uxn_opcodes_h_l1899_c7_5404
n16_MUX_uxn_opcodes_h_l1899_c7_5404 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond,
n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue,
n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse,
n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251
BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left,
BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right,
BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output);

-- l16_MUX_uxn_opcodes_h_l1903_c7_2af5
l16_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right,
BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output);

-- l16_MUX_uxn_opcodes_h_l1906_c7_3e68
l16_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68
result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output);

-- l16_MUX_uxn_opcodes_h_l1911_c7_837b
l16_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output);

-- l16_MUX_uxn_opcodes_h_l1914_c7_be71
l16_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f
BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left,
BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right,
BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69
BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right,
BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8
BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right,
BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output);

-- MUX_uxn_opcodes_h_l1918_c32_c6b6
MUX_uxn_opcodes_h_l1918_c32_c6b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1918_c32_c6b6_cond,
MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue,
MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse,
MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right,
BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a
CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x,
CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right,
BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1936_c34_6414
CONST_SR_8_uxn_opcodes_h_l1936_c34_6414 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x,
CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left,
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right,
BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04
result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond,
result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a
CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x,
CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9
CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output);



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
 n16,
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output,
 l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output,
 l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output,
 l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output,
 l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output,
 l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output,
 l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output,
 l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output,
 l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output,
 l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output,
 l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output,
 l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output,
 l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output,
 l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output,
 MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output,
 CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output,
 CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1870_c3_6a99 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_c3f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_aff7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1882_c3_72fe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d9ce : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1889_c3_5cd1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_8835 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_143f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_001c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_097e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_58e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_c08e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1923_c3_2c56 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1924_c24_64ea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1927_c3_cedf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1928_c24_ae73_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1931_c3_9e24 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1932_c24_eb05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_29ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1936_c24_edc8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_ffbb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1940_c24_8257_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3e02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1944_c24_2cf9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1914_l1942_DUPLICATE_5507_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1863_l1951_DUPLICATE_5bb7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d9ce := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_d9ce;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1882_c3_72fe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1882_c3_72fe;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_001c := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_001c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_8835 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1894_c3_8835;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1931_c3_9e24 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1931_c3_9e24;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1889_c3_5cd1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1889_c3_5cd1;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_29ba := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1935_c3_29ba;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right := to_unsigned(18, 5);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1923_c3_2c56 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1923_c3_2c56;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_097e := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1904_c3_097e;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_143f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_143f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_ffbb := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1939_c3_ffbb;
     VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3e02 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1943_c3_3e02;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1927_c3_cedf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1927_c3_cedf;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_c08e := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_c08e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right := to_unsigned(7, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_c3f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1874_c3_c3f6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_58e3 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_58e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right := to_unsigned(16, 5);
     VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1870_c3_6a99 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1870_c3_6a99;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_aff7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1879_c3_aff7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right := to_unsigned(10, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1899_c11_2dca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output := result.is_stack_read;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1940_c24_8257] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1940_c24_8257_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_9564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_left;
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output := BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1936_c34_6414] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output := CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1914_l1942_DUPLICATE_5507 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1914_l1942_DUPLICATE_5507_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1906_c11_6288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_left;
     BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output := BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_f480] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1942_c11_9436] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_left;
     BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output := BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_9352] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1932_c24_eb05] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1932_c24_eb05_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1888_c11_002e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1934_c11_d931] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_left;
     BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output := BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_c72b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c6_076c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1881_c11_c50d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1944_c34_c94a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output := CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1928_c34_3d9a] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output := CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output := result.is_stack_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1924_c24_64ea] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1924_c24_64ea_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1896_c11_274e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1920_c11_d952] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_left;
     BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output := BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1891_c11_8398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_left;
     BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output := BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1938_c11_89f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1876_c11_b21c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1884_c11_e29d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_d504] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1918_c32_0f69] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_left;
     BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output := BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_2341] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1946_c11_83b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1918_c32_0f69_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c6_076c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_d504_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1876_c11_b21c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1881_c11_c50d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1884_c11_e29d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1888_c11_002e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1891_c11_8398_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1896_c11_274e_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1899_c11_2dca_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_2341_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1906_c11_6288_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_9352_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_f480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1920_c11_d952_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_c72b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1934_c11_d931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1938_c11_89f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1942_c11_9436_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1946_c11_83b3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1907_l1900_l1885_l1877_l1892_l1915_DUPLICATE_e5c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1924_c24_64ea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1932_c24_eb05_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1940_c24_8257_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_270e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1920_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_DUPLICATE_ee0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1873_l1896_l1920_l1867_l1891_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_64a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1873_l1896_l1891_l1914_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_580f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1946_l1942_l1938_l1934_l1930_l1926_l1914_l1911_l1906_l1903_l1899_l1896_l1891_l1888_l1884_l1881_l1876_l1873_l1867_DUPLICATE_a741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1914_l1942_DUPLICATE_5507_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1914_l1942_DUPLICATE_5507_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1873_l1896_l1867_l1891_l1914_l1942_l1888_l1911_l1884_l1906_l1881_l1903_l1876_l1899_DUPLICATE_93e8_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1867_c1_66c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1885_c3_4d89] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_left;
     BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output := BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1944_c24_2cf9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1944_c24_2cf9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1944_c34_c94a_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1918_c32_aeb8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_left;
     BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output := BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1942_c7_af04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1915_c3_b62f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_left;
     BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output := BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1946_c7_d784] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1936_c24_edc8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1936_c24_edc8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1936_c34_6414_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1920_c7_07ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1900_c3_5251] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_left;
     BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output := BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1946_c7_d784] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1928_c24_ae73] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1928_c24_ae73_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1928_c34_3d9a_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1918_c32_aeb8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1885_c3_4d89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1900_c3_5251_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1915_c3_b62f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1928_c24_ae73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1936_c24_edc8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1944_c24_2cf9_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1893_l1908_l1878_DUPLICATE_77d9_return_output;
     VAR_printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1867_c1_66c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1946_c7_d784_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1946_c7_d784_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;
     -- t16_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- l16_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- MUX[uxn_opcodes_h_l1918_c32_c6b6] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1918_c32_c6b6_cond <= VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_cond;
     MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue <= VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iftrue;
     MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse <= VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output := MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1942_c7_af04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1942_c7_af04] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output := result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;

     -- n16_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- printf_uxn_opcodes_h_l1868_c3_8942[uxn_opcodes_h_l1868_c3_8942] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1868_c3_8942_uxn_opcodes_h_l1868_c3_8942_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1942_c7_af04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1938_c7_aef3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue := VAR_MUX_uxn_opcodes_h_l1918_c32_c6b6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1942_c7_af04_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     -- n16_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1938_c7_aef3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;

     -- l16_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1938_c7_aef3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1938_c7_aef3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1934_c7_c53f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1938_c7_aef3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1934_c7_c53f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1934_c7_c53f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1934_c7_c53f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1930_c7_c473] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- n16_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- l16_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1934_c7_c53f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_3d6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- n16_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1930_c7_c473] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output := result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1930_c7_c473] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;

     -- l16_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_c473] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1930_c7_c473_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- l16_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_3d6a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1920_c7_07ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_3d6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_3d6a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_3d6a_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1920_c7_07ba] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output := result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;

     -- l16_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1920_c7_07ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1920_c7_07ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1920_c7_07ba_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- l16_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- n16_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1914_c7_be71] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output := result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1914_c7_be71_return_output;
     -- n16_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- l16_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_837b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_837b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- l16_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- n16_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1906_c7_3e68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1906_c7_3e68_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_2af5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- l16_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_2af5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- l16_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1899_c7_5404] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1899_c7_5404_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- l16_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1896_c7_2b4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_l16_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1896_c7_2b4b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- l16_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1891_c7_1431] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output := result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1891_c7_1431_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1888_c7_6007] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1888_c7_6007_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1884_c7_1b85] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output := result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1884_c7_1b85_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1881_c7_18bc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1881_c7_18bc_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1876_c7_518b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1876_c7_518b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_00c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1873_c7_00c0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c2_4a4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1863_l1951_DUPLICATE_5bb7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1863_l1951_DUPLICATE_5bb7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1867_c2_4a4c_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1863_l1951_DUPLICATE_5bb7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1863_l1951_DUPLICATE_5bb7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
