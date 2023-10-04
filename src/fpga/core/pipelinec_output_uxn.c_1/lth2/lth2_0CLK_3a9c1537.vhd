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
-- Submodules: 107
entity lth2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth2_0CLK_3a9c1537;
architecture arch of lth2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1612_c6_169c]
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1612_c1_ee61]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1612_c2_a98e]
signal n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1613_c3_ae6f[uxn_opcodes_h_l1613_c3_ae6f]
signal printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_dbf2]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1618_c7_c038]
signal t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1618_c7_c038]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1618_c7_c038]
signal n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_d931]
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1621_c7_79b1]
signal n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_1121]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1626_c7_9a72]
signal n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_a79c]
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1629_c7_4daf]
signal n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1630_c3_96f8]
signal BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_7f46]
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1633_c7_dfa1]
signal n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1636_c11_fea8]
signal BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1636_c7_de75]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1636_c7_de75]
signal n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_c1c4]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1641_c7_5112]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1641_c7_5112]
signal n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1644_c11_f4ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1644_c7_7dce]
signal n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1645_c3_cbe6]
signal BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1648_c32_ad39]
signal BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1648_c32_b6a8]
signal BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1648_c32_40ef]
signal MUX_uxn_opcodes_h_l1648_c32_40ef_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1648_c32_40ef_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_31df]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_5617]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_5617]
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_5617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_5617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_5617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(7 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1654_c24_cd30]
signal BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1654_c24_c0b4]
signal MUX_uxn_opcodes_h_l1654_c24_c0b4_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_c5c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_828c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_828c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c
BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left,
BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right,
BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output);

-- t16_MUX_uxn_opcodes_h_l1612_c2_a98e
t16_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e
result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- n16_MUX_uxn_opcodes_h_l1612_c2_a98e
n16_MUX_uxn_opcodes_h_l1612_c2_a98e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond,
n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue,
n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse,
n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

-- printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f
printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f : entity work.printf_uxn_opcodes_h_l1613_c3_ae6f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output);

-- t16_MUX_uxn_opcodes_h_l1618_c7_c038
t16_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038
result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038
result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- n16_MUX_uxn_opcodes_h_l1618_c7_c038
n16_MUX_uxn_opcodes_h_l1618_c7_c038 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond,
n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue,
n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse,
n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output);

-- t16_MUX_uxn_opcodes_h_l1621_c7_79b1
t16_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- n16_MUX_uxn_opcodes_h_l1621_c7_79b1
n16_MUX_uxn_opcodes_h_l1621_c7_79b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond,
n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue,
n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse,
n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output);

-- t16_MUX_uxn_opcodes_h_l1626_c7_9a72
t16_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72
result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- n16_MUX_uxn_opcodes_h_l1626_c7_9a72
n16_MUX_uxn_opcodes_h_l1626_c7_9a72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond,
n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue,
n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse,
n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right,
BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output);

-- t16_MUX_uxn_opcodes_h_l1629_c7_4daf
t16_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf
result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- n16_MUX_uxn_opcodes_h_l1629_c7_4daf
n16_MUX_uxn_opcodes_h_l1629_c7_4daf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond,
n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue,
n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse,
n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8
BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left,
BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right,
BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right,
BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- n16_MUX_uxn_opcodes_h_l1633_c7_dfa1
n16_MUX_uxn_opcodes_h_l1633_c7_dfa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond,
n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue,
n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse,
n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8
BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left,
BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right,
BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75
result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75
result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75
result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75
result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75
result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75
result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- n16_MUX_uxn_opcodes_h_l1636_c7_de75
n16_MUX_uxn_opcodes_h_l1636_c7_de75 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond,
n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue,
n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse,
n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112
result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- n16_MUX_uxn_opcodes_h_l1641_c7_5112
n16_MUX_uxn_opcodes_h_l1641_c7_5112 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond,
n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue,
n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse,
n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce
result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce
result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- n16_MUX_uxn_opcodes_h_l1644_c7_7dce
n16_MUX_uxn_opcodes_h_l1644_c7_7dce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond,
n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue,
n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse,
n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6
BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left,
BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right,
BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39
BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left,
BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right,
BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8
BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left,
BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right,
BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output);

-- MUX_uxn_opcodes_h_l1648_c32_40ef
MUX_uxn_opcodes_h_l1648_c32_40ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1648_c32_40ef_cond,
MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue,
MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse,
MUX_uxn_opcodes_h_l1648_c32_40ef_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30
BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30 : entity work.BIN_OP_LT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left,
BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right,
BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output);

-- MUX_uxn_opcodes_h_l1654_c24_c0b4
MUX_uxn_opcodes_h_l1654_c24_c0b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1654_c24_c0b4_cond,
MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue,
MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse,
MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1
CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output,
 t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output,
 t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output,
 t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output,
 t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output,
 t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output,
 MUX_uxn_opcodes_h_l1648_c32_40ef_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output,
 MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_915d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e7d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_3d15 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_82fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_c554 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1634_c3_1e42 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_3dc8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_5dca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_4f41 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1644_l1650_DUPLICATE_3490_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1661_l1608_DUPLICATE_5dee_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_5dca := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_5dca;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_82fd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1627_c3_82fd;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_4f41 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1653_c3_4f41;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_3dc8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_3dc8;
     VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_c554 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_c554;
     VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_3d15 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1624_c3_3d15;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e7d9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e7d9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_915d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1615_c3_915d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1634_c3_1e42 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1634_c3_1e42;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left := VAR_phase;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_1121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l1654_c24_cd30] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_left;
     BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output := BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_d931] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_left;
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output := BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1636_c11_fea8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1633_c11_7f46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_left;
     BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output := BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1629_c11_a79c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_31df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_c1c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_c5c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_dbf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1648_c32_ad39] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_left;
     BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output := BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1612_c6_169c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1644_c11_f4ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1644_l1650_DUPLICATE_3490 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1644_l1650_DUPLICATE_3490_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1648_c32_ad39_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1612_c6_169c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_dbf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_d931_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_1121_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c11_a79c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1633_c11_7f46_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1636_c11_fea8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_c1c4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1644_c11_f4ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_31df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_c5c2_return_output;
     VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1654_c24_cd30_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1637_l1622_l1630_l1645_DUPLICATE_8d82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_37da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1636_l1633_l1656_l1629_DUPLICATE_b80c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_c65e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1636_l1633_l1629_DUPLICATE_6c95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1626_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1656_l1629_DUPLICATE_9621_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1644_l1650_DUPLICATE_3490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1644_l1650_DUPLICATE_3490_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1626_l1650_l1621_l1644_l1618_l1641_l1612_l1636_l1633_l1629_DUPLICATE_4f85_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_5617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_5617] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1612_c1_ee61] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1630_c3_96f8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_left;
     BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output := BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output;

     -- MUX[uxn_opcodes_h_l1654_c24_c0b4] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1654_c24_c0b4_cond <= VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_cond;
     MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue <= VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iftrue;
     MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse <= VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output := MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_828c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1645_c3_cbe6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_left;
     BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output := BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1648_c32_b6a8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_left;
     BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output := BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1656_c7_828c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1648_c32_b6a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1630_c3_96f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1645_c3_cbe6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1623_l1638_DUPLICATE_eca1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue := VAR_MUX_uxn_opcodes_h_l1654_c24_c0b4_return_output;
     VAR_printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1612_c1_ee61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_828c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1656_c7_828c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_5617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1650_c7_5617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;

     -- t16_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- printf_uxn_opcodes_h_l1613_c3_ae6f[uxn_opcodes_h_l1613_c3_ae6f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1613_c3_ae6f_uxn_opcodes_h_l1613_c3_ae6f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1648_c32_40ef] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1648_c32_40ef_cond <= VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_cond;
     MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue <= VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iftrue;
     MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse <= VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_return_output := MUX_uxn_opcodes_h_l1648_c32_40ef_return_output;

     -- n16_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1650_c7_5617] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output := result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue := VAR_MUX_uxn_opcodes_h_l1648_c32_40ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1650_c7_5617_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- t16_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1644_c7_7dce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;

     -- n16_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1644_c7_7dce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- t16_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_5112] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1641_c7_5112_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- t16_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1636_c7_de75] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1636_c7_de75_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1633_c7_dfa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1633_c7_dfa1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- n16_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c7_4daf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1629_c7_4daf_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1626_c7_9a72] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1626_c7_9a72_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_79b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_79b1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1618_c7_c038] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1618_c7_c038_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1612_c2_a98e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1661_l1608_DUPLICATE_5dee LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1661_l1608_DUPLICATE_5dee_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1612_c2_a98e_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1661_l1608_DUPLICATE_5dee_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1661_l1608_DUPLICATE_5dee_return_output;
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
