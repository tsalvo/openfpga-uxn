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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1958_c6_1522]
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1958_c1_bb39]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1958_c2_cbc5]
signal t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1959_c3_16b9[uxn_opcodes_h_l1959_c3_16b9]
signal printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1964_c11_47cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1964_c7_e6e1]
signal t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_4b1d]
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1967_c7_13bb]
signal t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1969_c3_8d4b]
signal CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_3909]
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_557a]
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1972_c7_557a]
signal t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_b240]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1975_c7_1bc2]
signal t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1976_c3_b272]
signal BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1979_c32_7c5d]
signal BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1979_c32_0c84]
signal BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1979_c32_b308]
signal MUX_uxn_opcodes_h_l1979_c32_b308_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1979_c32_b308_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c32_b308_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1979_c32_b308_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_9ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_4265]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_4265]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1981_c7_4265]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1981_c7_4265]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1981_c7_4265]
signal result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1987_c11_e231]
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1987_c7_f12f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1987_c7_f12f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1987_c7_f12f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1987_c7_f12f]
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_25b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1991_c7_4d6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_4d6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_4d6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1991_c7_4d6e]
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1995_c11_f896]
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c7_2bfb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1995_c7_2bfb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c7_2bfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1995_c7_2bfb]
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_28cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1999_c7_1a0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_1a0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522
BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left,
BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right,
BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5
result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- t16_MUX_uxn_opcodes_h_l1958_c2_cbc5
t16_MUX_uxn_opcodes_h_l1958_c2_cbc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond,
t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue,
t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse,
t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

-- printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9
printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9 : entity work.printf_uxn_opcodes_h_l1959_c3_16b9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb
BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1
result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- t16_MUX_uxn_opcodes_h_l1964_c7_e6e1
t16_MUX_uxn_opcodes_h_l1964_c7_e6e1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond,
t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue,
t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse,
t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb
result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- t16_MUX_uxn_opcodes_h_l1967_c7_13bb
t16_MUX_uxn_opcodes_h_l1967_c7_13bb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond,
t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue,
t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse,
t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b
CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x,
CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right,
BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a
result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- t16_MUX_uxn_opcodes_h_l1972_c7_557a
t16_MUX_uxn_opcodes_h_l1972_c7_557a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond,
t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue,
t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse,
t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- t16_MUX_uxn_opcodes_h_l1975_c7_1bc2
t16_MUX_uxn_opcodes_h_l1975_c7_1bc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond,
t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue,
t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse,
t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272
BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left,
BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right,
BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d
BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left,
BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right,
BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84
BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left,
BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right,
BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output);

-- MUX_uxn_opcodes_h_l1979_c32_b308
MUX_uxn_opcodes_h_l1979_c32_b308 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1979_c32_b308_cond,
MUX_uxn_opcodes_h_l1979_c32_b308_iftrue,
MUX_uxn_opcodes_h_l1979_c32_b308_iffalse,
MUX_uxn_opcodes_h_l1979_c32_b308_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265
result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265
result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond,
result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left,
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right,
BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e
result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left,
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right,
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb
result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1
CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output,
 CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output,
 MUX_uxn_opcodes_h_l1979_c32_b308_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_4355 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_55a0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_6f45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_0d7d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c32_b308_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1979_c32_b308_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_161e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_4e33 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_d280 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_ae1b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1976_l1968_DUPLICATE_f981_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1995_l1975_DUPLICATE_f3d1_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1985_l1993_DUPLICATE_a87b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1989_l1997_DUPLICATE_70a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1954_l2004_DUPLICATE_1402_return_output : opcode_result_t;
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
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_d280 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1992_c3_d280;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_4e33 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1988_c3_4e33;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_6f45 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1970_c3_6f45;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_55a0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1965_c3_55a0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_0d7d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_0d7d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_ae1b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1996_c3_ae1b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_161e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_161e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_4355 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_4355;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right := to_unsigned(9, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right := to_unsigned(8, 4);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1995_c11_f896] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_left;
     BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output := BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_28cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_b240] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1995_l1975_DUPLICATE_f3d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1995_l1975_DUPLICATE_f3d1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_4b1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1987_c11_e231] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_left;
     BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output := BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1958_c6_1522] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_left;
     BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output := BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1979_c32_7c5d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_left;
     BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output := BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1991_c11_25b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1964_c11_47cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1981_c11_9ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1976_l1968_DUPLICATE_f981 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1976_l1968_DUPLICATE_f981_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1985_l1993_DUPLICATE_a87b LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1985_l1993_DUPLICATE_a87b_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1972_c11_3909] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_left;
     BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output := BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1979_c32_7c5d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c6_1522_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1964_c11_47cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_4b1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1972_c11_3909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_b240_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1981_c11_9ff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1987_c11_e231_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1991_c11_25b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_f896_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_28cb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1976_l1968_DUPLICATE_f981_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1976_l1968_DUPLICATE_f981_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1985_l1993_DUPLICATE_a87b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1985_l1993_DUPLICATE_a87b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1975_DUPLICATE_8311_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1987_l1981_l1975_DUPLICATE_1451_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1972_l1967_l1964_l1958_l1981_DUPLICATE_cd39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1972_l1964_l1975_l1967_DUPLICATE_5207_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1972_l1999_l1967_l1995_l1964_l1991_l1958_l1987_l1975_DUPLICATE_7a44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1995_l1975_DUPLICATE_f3d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1995_l1975_DUPLICATE_f3d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1972_l1967_l1995_l1964_l1958_l1975_DUPLICATE_47d6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1981_c7_4265] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_1a0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c7_2bfb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1969_c3_8d4b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output := CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1958_c1_bb39] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1976_c3_b272] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_left;
     BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output := BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1999_c7_1a0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1989_l1997_DUPLICATE_70a9 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1989_l1997_DUPLICATE_70a9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l1997_l1989_DUPLICATE_08d1_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l1979_c32_0c84] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_left;
     BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output := BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1979_c32_b308_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1979_c32_0c84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1976_c3_b272_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1989_l1997_DUPLICATE_70a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l1989_l1997_DUPLICATE_70a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1969_c3_8d4b_return_output;
     VAR_printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1958_c1_bb39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1999_c7_1a0a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1995_c7_2bfb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1995_c7_2bfb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c7_2bfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- printf_uxn_opcodes_h_l1959_c3_16b9[uxn_opcodes_h_l1959_c3_16b9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1959_c3_16b9_uxn_opcodes_h_l1959_c3_16b9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1991_c7_4d6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- MUX[uxn_opcodes_h_l1979_c32_b308] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1979_c32_b308_cond <= VAR_MUX_uxn_opcodes_h_l1979_c32_b308_cond;
     MUX_uxn_opcodes_h_l1979_c32_b308_iftrue <= VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iftrue;
     MUX_uxn_opcodes_h_l1979_c32_b308_iffalse <= VAR_MUX_uxn_opcodes_h_l1979_c32_b308_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1979_c32_b308_return_output := MUX_uxn_opcodes_h_l1979_c32_b308_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue := VAR_MUX_uxn_opcodes_h_l1979_c32_b308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1995_c7_2bfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1991_c7_4d6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1991_c7_4d6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1987_c7_f12f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1991_c7_4d6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1991_c7_4d6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1981_c7_4265] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1987_c7_f12f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1987_c7_f12f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1987_c7_f12f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1987_c7_f12f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1981_c7_4265] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1981_c7_4265] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output := result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- t16_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1981_c7_4265] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1981_c7_4265_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_1bc2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1975_c7_1bc2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1972_c7_557a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1972_c7_557a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_13bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1967_c7_13bb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1964_c7_e6e1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1964_c7_e6e1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1958_c2_cbc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1954_l2004_DUPLICATE_1402 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1954_l2004_DUPLICATE_1402_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1958_c2_cbc5_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1954_l2004_DUPLICATE_1402_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l1954_l2004_DUPLICATE_1402_return_output;
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
