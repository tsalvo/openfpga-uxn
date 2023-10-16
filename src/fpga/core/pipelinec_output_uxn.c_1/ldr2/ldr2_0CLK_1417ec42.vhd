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
-- BIN_OP_EQ[uxn_opcodes_h_l1726_c6_9c72]
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1726_c1_9077]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1726_c2_b9ee]
signal t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1727_c3_6e77[uxn_opcodes_h_l1727_c3_6e77]
signal printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_7789]
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1731_c7_0062]
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_0062]
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1731_c7_0062]
signal t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_88e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_16fd]
signal t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1737_c30_b829]
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1738_c22_276f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_ac6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1740_c7_637c]
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1740_c7_637c]
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_1927]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_43cc]
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1746_c3_68e2]
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_b98d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_af66]
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1749_c7_5638]
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_5638]
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_5638]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_5638]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_5638]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_5638]
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_c524]
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_5bac]
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1752_c7_0907]
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_0907]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_0907]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_0907]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_0907]
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1753_c3_e8c7]
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_8370]
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_2505]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_2505]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_2505]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_2505]
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1760_c31_dc92]
signal CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_54b1]
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_3700]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_3700]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a88( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left,
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right,
BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee
tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- t8_MUX_uxn_opcodes_h_l1726_c2_b9ee
t8_MUX_uxn_opcodes_h_l1726_c2_b9ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond,
t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue,
t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse,
t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

-- printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77
printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77 : entity work.printf_uxn_opcodes_h_l1727_c3_6e77_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right,
BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1731_c7_0062
tmp16_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- t8_MUX_uxn_opcodes_h_l1731_c7_0062
t8_MUX_uxn_opcodes_h_l1731_c7_0062 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond,
t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue,
t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse,
t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd
tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_16fd
t8_MUX_uxn_opcodes_h_l1734_c7_16fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1737_c30_b829
sp_relative_shift_uxn_opcodes_h_l1737_c30_b829 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins,
sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x,
sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y,
sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1740_c7_637c
tmp16_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc
tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2
CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x,
CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right,
BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1749_c7_5638
tmp16_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1752_c7_0907
tmp16_MUX_uxn_opcodes_h_l1752_c7_0907 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond,
tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue,
tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse,
tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7
BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left,
BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right,
BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right,
BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92
CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x,
CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right,
BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output,
 tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output,
 tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output,
 sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output,
 tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output,
 CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output,
 tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output,
 tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output,
 CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_b2f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_5d7a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1738_c3_66bd : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_94fb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1742_c3_e1f9 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1747_c3_e1fe : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0058 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_209a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_b17a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_bb43 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_5f2b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1750_l1747_DUPLICATE_656d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_72ee_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1767_l1721_DUPLICATE_2039_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_5d7a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1732_c3_5d7a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_b2f9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_b2f9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_bb43 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1759_c3_bb43;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_209a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_209a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right := to_unsigned(8, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse := tmp16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1762_c11_54b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1740_c11_ac6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1726_c6_9c72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_left;
     BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output := BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_72ee LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_72ee_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1731_c11_7789] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_left;
     BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output := BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_5bac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c11_1927] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1758_c11_8370] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_left;
     BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output := BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1760_c31_dc92] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output := CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1737_c30_b829] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_ins;
     sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_x;
     sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output := sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_88e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1750_l1747_DUPLICATE_656d LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1750_l1747_DUPLICATE_656d_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1749_c11_af66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1738_c27_94fb] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_94fb_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c6_9c72_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1731_c11_7789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_88e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1740_c11_ac6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c11_1927_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1749_c11_af66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_5bac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1758_c11_8370_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1762_c11_54b1_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1738_c27_94fb_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1742_l1750_l1747_DUPLICATE_656d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_72ee_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1745_l1753_DUPLICATE_72ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1731_l1734_l1726_DUPLICATE_a275_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1731_l1749_l1726_DUPLICATE_ebc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1752_l1749_l1744_l1740_DUPLICATE_ec74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1731_l1726_l1740_DUPLICATE_25da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1734_l1762_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_f4d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1734_l1758_l1749_l1744_l1740_DUPLICATE_24a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1734_l1731_l1758_l1726_l1749_l1744_l1740_DUPLICATE_db4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1737_c30_b829_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l1746_c3_68e2] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output := CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1726_c1_9077] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1753_c3_e8c7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_left;
     BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output := BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1762_c7_3700] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1760_c21_5f2b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_5f2b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1760_c31_dc92_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1758_c7_2505] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1762_c7_3700] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output;

     -- t8_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1738_c22_276f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1738_c3_66bd := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1738_c22_276f_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1742_c3_e1f9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1747_l1742_l1750_DUPLICATE_3b42_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1760_c21_5f2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1746_c3_68e2_return_output;
     VAR_printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1726_c1_9077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1762_c7_3700_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1762_c7_3700_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1738_c3_66bd;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1742_c3_e1f9;
     -- printf_uxn_opcodes_h_l1727_c3_6e77[uxn_opcodes_h_l1727_c3_6e77] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1727_c3_6e77_uxn_opcodes_h_l1727_c3_6e77_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_c524] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1758_c7_2505] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output := result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_0907] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1747_c22_b98d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output;

     -- t8_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1752_c7_0907] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_cond;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output := tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1756_c21_b17a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_b17a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1753_c3_e8c7_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1758_c7_2505] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1758_c7_2505] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1747_c3_e1fe := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1747_c22_b98d_return_output)),16);
     VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0058 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_c524_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1756_c21_b17a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1758_c7_2505_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1747_c3_e1fe;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0058;
     -- t8_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_0907] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_0907] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_0907] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output := result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_0907_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1749_c7_5638] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output := result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1749_c7_5638_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1744_c7_43cc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1744_c7_43cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1740_c7_637c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1740_c7_637c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_16fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_16fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1731_c7_0062] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output := result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1731_c7_0062_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c2_b9ee] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1767_l1721_DUPLICATE_2039 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1767_l1721_DUPLICATE_2039_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a88(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1726_c2_b9ee_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1767_l1721_DUPLICATE_2039_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a88_uxn_opcodes_h_l1767_l1721_DUPLICATE_2039_return_output;
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
