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
-- Submodules: 69
entity str1_0CLK_a45e5d62 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_a45e5d62;
architecture arch of str1_0CLK_a45e5d62 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1945_c6_55af]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1945_c1_7d3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1945_c2_ea1d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1946_c3_4191[uxn_opcodes_h_l1946_c3_4191]
signal printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1951_c11_db9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1951_c7_5d37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_cfb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c7_d7ce]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_56ee]
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_5f85]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_906f]
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1961_c7_668e]
signal n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1961_c7_668e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1965_c32_aade]
signal BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1965_c32_35d9]
signal BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1965_c32_c41f]
signal MUX_uxn_opcodes_h_l1965_c32_c41f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1965_c32_c41f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_d53d]
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_b611]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1967_c7_b611]
signal result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1967_c7_b611]
signal result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_b611]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1967_c7_b611]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1970_c21_182b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1973_c11_2377]
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c7_e4b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1973_c7_e4b0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6c87( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_addr := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_stack_read := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output);

-- t8_MUX_uxn_opcodes_h_l1945_c2_ea1d
t8_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- n8_MUX_uxn_opcodes_h_l1945_c2_ea1d
n8_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

-- printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191
printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191 : entity work.printf_uxn_opcodes_h_l1946_c3_4191_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output);

-- t8_MUX_uxn_opcodes_h_l1951_c7_5d37
t8_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- n8_MUX_uxn_opcodes_h_l1951_c7_5d37
n8_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output);

-- t8_MUX_uxn_opcodes_h_l1954_c7_d7ce
t8_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- n8_MUX_uxn_opcodes_h_l1954_c7_d7ce
n8_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output);

-- n8_MUX_uxn_opcodes_h_l1958_c7_5f85
n8_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output);

-- n8_MUX_uxn_opcodes_h_l1961_c7_668e
n8_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade
BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left,
BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right,
BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9
BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left,
BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right,
BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output);

-- MUX_uxn_opcodes_h_l1965_c32_c41f
MUX_uxn_opcodes_h_l1965_c32_c41f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1965_c32_c41f_cond,
MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue,
MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse,
MUX_uxn_opcodes_h_l1965_c32_c41f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right,
BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611
result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611
result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond,
result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611
result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b
BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left,
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right,
BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0
result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output);



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
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output,
 t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output,
 t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output,
 t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output,
 n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output,
 n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output,
 MUX_uxn_opcodes_h_l1965_c32_c41f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_38a7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_0fcb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_2e93 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_0998 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1958_c7_5f85_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1970_c3_ef69 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1970_c26_847b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1978_l1941_DUPLICATE_8d3c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_2e93 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_2e93;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_38a7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_38a7;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_0fcb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_0fcb;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_0998 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_0998;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := n8;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_906f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_56ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1967_c11_d53d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c6_55af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1965_c32_aade] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_left;
     BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output := BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_cfb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1970_c26_847b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1970_c26_847b_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1951_c11_db9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1958_c7_5f85_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1973_c11_2377] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_left;
     BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output := BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1965_c32_aade_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_55af_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_db9c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_cfb6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_56ee_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_906f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1967_c11_d53d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1973_c11_2377_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1970_c26_847b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1951_l1945_l1961_l1958_l1954_DUPLICATE_3826_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_7581_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1951_l1973_l1967_l1961_l1958_l1954_DUPLICATE_e68f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1951_l1945_l1973_l1961_l1958_l1954_DUPLICATE_17ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1958_l1954_DUPLICATE_8773_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1958_l1951_l1961_l1954_DUPLICATE_76f7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1951_l1945_l1967_l1961_l1958_l1954_DUPLICATE_0098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1958_c7_5f85_return_output;
     -- n8_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1965_c32_35d9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_left;
     BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output := BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1967_c7_b611] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output := result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1970_c21_182b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1973_c7_e4b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1967_c7_b611] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1973_c7_e4b0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1945_c1_7d3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1965_c32_35d9_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1970_c3_ef69 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1970_c21_182b_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_7d3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1973_c7_e4b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1970_c3_ef69;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1967_c7_b611] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1967_c7_b611] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1967_c7_b611] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- MUX[uxn_opcodes_h_l1965_c32_c41f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1965_c32_c41f_cond <= VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_cond;
     MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue <= VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iftrue;
     MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse <= VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_return_output := MUX_uxn_opcodes_h_l1965_c32_c41f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- printf_uxn_opcodes_h_l1946_c3_4191[uxn_opcodes_h_l1946_c3_4191] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1946_c3_4191_uxn_opcodes_h_l1946_c3_4191_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue := VAR_MUX_uxn_opcodes_h_l1965_c32_c41f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1967_c7_b611_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- t8_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_668e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_668e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- n8_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_5f85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_5f85_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1954_c7_d7ce] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;

     -- n8_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_d7ce_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1951_c7_5d37] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_5d37_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1945_c2_ea1d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1978_l1941_DUPLICATE_8d3c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1978_l1941_DUPLICATE_8d3c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_ea1d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1978_l1941_DUPLICATE_8d3c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1978_l1941_DUPLICATE_8d3c_return_output;
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
