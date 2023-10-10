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
-- Submodules: 96
entity str2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_5ccafc54;
architecture arch of str2_0CLK_5ccafc54 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1923_c6_fea7]
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1923_c1_ef78]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1923_c2_b867]
signal n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c2_b867]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1923_c2_b867]
signal t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1924_c3_a19d[uxn_opcodes_h_l1924_c3_a19d]
signal printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_2852]
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1929_c7_e434]
signal n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_e434]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1929_c7_e434]
signal t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1932_c11_1bfa]
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1932_c7_3b03]
signal t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_68ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1936_c7_d157]
signal n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_d157]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_ce41]
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_f19a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1941_c3_d71d]
signal CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_de83]
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_0b65]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1947_c11_5493]
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1947_c7_7286]
signal n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c7_7286]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1948_c3_f416]
signal BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1951_c32_0dbc]
signal BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1951_c32_ba9e]
signal BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1951_c32_6ba3]
signal MUX_uxn_opcodes_h_l1951_c32_6ba3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1954_c32_2625]
signal CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1956_c11_1678]
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1956_c7_f9a2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1956_c7_f9a2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1956_c7_f9a2]
signal result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1956_c7_f9a2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1956_c7_f9a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1958_c21_ec46]
signal BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_0d10]
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_da74]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_da74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output : signed(17 downto 0);

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

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7
BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left,
BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right,
BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output);

-- n16_MUX_uxn_opcodes_h_l1923_c2_b867
n16_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867
result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867
result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867
result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- t8_MUX_uxn_opcodes_h_l1923_c2_b867
t8_MUX_uxn_opcodes_h_l1923_c2_b867 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond,
t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue,
t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse,
t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

-- printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d
printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d : entity work.printf_uxn_opcodes_h_l1924_c3_a19d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output);

-- n16_MUX_uxn_opcodes_h_l1929_c7_e434
n16_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434
result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434
result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434
result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434
result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434
result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434
result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- t8_MUX_uxn_opcodes_h_l1929_c7_e434
t8_MUX_uxn_opcodes_h_l1929_c7_e434 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond,
t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue,
t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse,
t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left,
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right,
BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output);

-- n16_MUX_uxn_opcodes_h_l1932_c7_3b03
n16_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03
result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03
result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03
result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03
result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03
result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- t8_MUX_uxn_opcodes_h_l1932_c7_3b03
t8_MUX_uxn_opcodes_h_l1932_c7_3b03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond,
t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue,
t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse,
t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output);

-- n16_MUX_uxn_opcodes_h_l1936_c7_d157
n16_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157
result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157
result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157
result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157
result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157
result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output);

-- n16_MUX_uxn_opcodes_h_l1939_c7_f19a
n16_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a
result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a
result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a
result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a
result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a
result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d
CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x,
CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right,
BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output);

-- n16_MUX_uxn_opcodes_h_l1944_c7_0b65
n16_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65
result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65
result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65
result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493
BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left,
BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right,
BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output);

-- n16_MUX_uxn_opcodes_h_l1947_c7_7286
n16_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286
result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286
result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286
result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286
result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416
BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left,
BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right,
BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc
BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left,
BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right,
BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e
BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left,
BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right,
BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output);

-- MUX_uxn_opcodes_h_l1951_c32_6ba3
MUX_uxn_opcodes_h_l1951_c32_6ba3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1951_c32_6ba3_cond,
MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue,
MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse,
MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1954_c32_2625
CONST_SR_8_uxn_opcodes_h_l1954_c32_2625 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x,
CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left,
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right,
BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2
result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2
result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond,
result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2
result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46
BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left,
BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right,
BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output,
 n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output,
 n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output,
 n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output,
 n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output,
 n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output,
 CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output,
 n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output,
 n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output,
 MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_089c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_bcea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_6188 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_b70d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_7795 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1945_c3_909d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1944_c7_0b65_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1953_c3_35cf : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1954_c22_0916_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1958_c3_42b7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1959_c22_a927_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1940_l1948_DUPLICATE_377a_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_10c9_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1918_l1966_DUPLICATE_c95c_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_7795 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1942_c3_7795;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_6188 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1934_c3_6188;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_b70d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1937_c3_b70d;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1945_c3_909d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1945_c3_909d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse := resize(to_signed(-3, 3), 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_bcea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1930_c3_bcea;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_089c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1926_c3_089c;

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1951_c32_0dbc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_left;
     BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output := BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_ce41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_left;
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output := BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1940_l1948_DUPLICATE_377a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1940_l1948_DUPLICATE_377a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1944_c11_de83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1944_c7_0b65_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1936_c11_68ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_2852] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_left;
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output := BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1956_c11_1678] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_left;
     BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output := BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1923_c6_fea7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output := result.ram_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1959_c22_a927] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1959_c22_a927_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1947_c11_5493] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_left;
     BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output := BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_10c9 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_10c9_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_0d10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1932_c11_1bfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1951_c32_0dbc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1923_c6_fea7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_2852_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1932_c11_1bfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1936_c11_68ca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_ce41_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1944_c11_de83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1947_c11_5493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1956_c11_1678_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_0d10_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_10c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1940_l1948_DUPLICATE_377a_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1940_l1948_DUPLICATE_377a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1959_c22_a927_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1929_l1923_l1947_l1944_l1939_l1936_l1932_DUPLICATE_412e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_0d14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1929_l1956_l1947_l1944_l1939_l1936_l1932_l1961_DUPLICATE_4b45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_l1961_DUPLICATE_23ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_219d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1929_l1947_l1944_l1939_l1936_l1932_DUPLICATE_5432_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1929_l1956_l1923_l1944_l1939_l1936_l1932_DUPLICATE_c8e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1944_c7_0b65_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1956_c7_f9a2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output := result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1923_c1_ef78] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1956_c7_f9a2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_da74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1941_c3_d71d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output := CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_da74] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1951_c32_ba9e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_left;
     BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output := BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1948_c3_f416] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_left;
     BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output := BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1951_c32_ba9e_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1948_c3_f416_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1953_c3_35cf := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1953_l1958_DUPLICATE_93a5_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1941_c3_d71d_return_output;
     VAR_printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1923_c1_ef78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_da74_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_da74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1953_c3_35cf;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1956_c7_f9a2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1954_c32_2625] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output := CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output;

     -- t8_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- n16_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1956_c7_f9a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;

     -- MUX[uxn_opcodes_h_l1951_c32_6ba3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1951_c32_6ba3_cond <= VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_cond;
     MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue <= VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iftrue;
     MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse <= VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output := MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- printf_uxn_opcodes_h_l1924_c3_a19d[uxn_opcodes_h_l1924_c3_a19d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1924_c3_a19d_uxn_opcodes_h_l1924_c3_a19d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1958_c21_ec46] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1958_c3_42b7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1958_c21_ec46_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := VAR_MUX_uxn_opcodes_h_l1951_c32_6ba3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1958_c3_42b7;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1954_c22_0916] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1954_c22_0916_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1954_c32_2625_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1956_c7_f9a2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1954_c22_0916_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1956_c7_f9a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1947_c7_7286] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1947_c7_7286_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1944_c7_0b65] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output := result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- n16_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1944_c7_0b65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- n16_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1939_c7_f19a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1939_c7_f19a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1936_c7_d157] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output := result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1936_c7_d157_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- n16_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1932_c7_3b03] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1932_c7_3b03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1929_c7_e434] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output := result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;

     -- Submodule level 10
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1929_c7_e434_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1923_c2_b867] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1918_l1966_DUPLICATE_c95c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1918_l1966_DUPLICATE_c95c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1923_c2_b867_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1923_c2_b867_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1918_l1966_DUPLICATE_c95c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1918_l1966_DUPLICATE_c95c_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
