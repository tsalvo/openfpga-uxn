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
entity lda_0CLK_d853ed1b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_d853ed1b;
architecture arch of lda_0CLK_d853ed1b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1607_c6_acbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1607_c1_cb3f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1607_c2_2e4a]
signal tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1608_c3_83b9[uxn_opcodes_h_l1608_c3_83b9]
signal printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_e27b]
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1613_c7_d97e]
signal tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_704a]
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1616_c7_e4ca]
signal tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1618_c3_9d69]
signal CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_5653]
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1621_c7_0b2a]
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_ff22]
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1624_c7_926c]
signal t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1624_c7_926c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1624_c7_926c]
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1625_c3_1c3d]
signal BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1628_c32_25dd]
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1628_c32_fe79]
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1628_c32_16cf]
signal MUX_uxn_opcodes_h_l1628_c32_16cf_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1628_c32_16cf_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6905]
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1630_c7_e99e]
signal tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_9aa9]
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1635_c7_7c89]
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1638_c11_4e71]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1638_c7_b9ec]
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_3a10]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_ba50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1645_c7_ba50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd
BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output);

-- t16_MUX_uxn_opcodes_h_l1607_c2_2e4a
t16_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a
result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a
tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond,
tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

-- printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9
printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9 : entity work.printf_uxn_opcodes_h_l1608_c3_83b9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output);

-- t16_MUX_uxn_opcodes_h_l1613_c7_d97e
t16_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e
result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e
result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e
tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond,
tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output);

-- t16_MUX_uxn_opcodes_h_l1616_c7_e4ca
t16_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca
result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca
tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond,
tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue,
tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse,
tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69
CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x,
CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right,
BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output);

-- t16_MUX_uxn_opcodes_h_l1621_c7_0b2a
t16_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a
tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right,
BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output);

-- t16_MUX_uxn_opcodes_h_l1624_c7_926c
t16_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c
result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1624_c7_926c
tmp8_MUX_uxn_opcodes_h_l1624_c7_926c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond,
tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d
BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left,
BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right,
BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd
BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left,
BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right,
BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79
BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left,
BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right,
BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output);

-- MUX_uxn_opcodes_h_l1628_c32_16cf
MUX_uxn_opcodes_h_l1628_c32_16cf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1628_c32_16cf_cond,
MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue,
MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse,
MUX_uxn_opcodes_h_l1628_c32_16cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right,
BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e
result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e
result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e
tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond,
tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue,
tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse,
tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right,
BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89
tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond,
tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue,
tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse,
tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec
tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond,
tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue,
tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse,
tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50
result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output,
 t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output,
 t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output,
 t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output,
 CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output,
 t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output,
 t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output,
 MUX_uxn_opcodes_h_l1628_c32_16cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_3544 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_4253 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e73a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_684f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_d976 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1617_l1625_DUPLICATE_fa8c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1650_l1602_DUPLICATE_9dbb_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_684f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1622_c3_684f;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_d976 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1642_c3_d976;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_3544 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_3544;
     VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e73a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1619_c3_e73a;
     VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_4253 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_4253;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right := to_unsigned(7, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1621_c11_5653] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_left;
     BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output := BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1607_c6_acbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1630_c11_6905] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_left;
     BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output := BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_704a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_3a10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1635_c11_9aa9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1617_l1625_DUPLICATE_fa8c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1617_l1625_DUPLICATE_fa8c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_e27b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1624_c11_ff22] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_left;
     BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output := BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output := result.is_ram_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1628_c32_25dd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_left;
     BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output := BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c11_4e71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1628_c32_25dd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1607_c6_acbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_e27b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_704a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1621_c11_5653_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1624_c11_ff22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1630_c11_6905_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1635_c11_9aa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c11_4e71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_3a10_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1617_l1625_DUPLICATE_fa8c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1617_l1625_DUPLICATE_fa8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1624_DUPLICATE_1d21_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1635_l1624_DUPLICATE_36b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1638_l1635_l1630_l1624_DUPLICATE_4a90_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1624_DUPLICATE_d256_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1607_l1630_DUPLICATE_6edc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1621_l1613_l1624_l1616_DUPLICATE_eef5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1621_l1616_l1645_l1613_l1607_l1635_l1630_l1624_DUPLICATE_b7f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1635_l1624_l1638_l1630_DUPLICATE_a85c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1621_l1616_l1613_l1638_l1607_l1635_l1630_l1624_DUPLICATE_883d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1625_c3_1c3d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_left;
     BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output := BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1607_c1_cb3f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_ba50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1645_c7_ba50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1618_c3_9d69] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output := CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1628_c32_fe79] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_left;
     BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output := BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1628_c32_fe79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1625_c3_1c3d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1618_c3_9d69_return_output;
     VAR_printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1607_c1_cb3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1645_c7_ba50_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c7_b9ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- printf_uxn_opcodes_h_l1608_c3_83b9[uxn_opcodes_h_l1608_c3_83b9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1608_c3_83b9_uxn_opcodes_h_l1608_c3_83b9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- t16_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- MUX[uxn_opcodes_h_l1628_c32_16cf] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1628_c32_16cf_cond <= VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_cond;
     MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue <= VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iftrue;
     MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse <= VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_return_output := MUX_uxn_opcodes_h_l1628_c32_16cf_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue := VAR_MUX_uxn_opcodes_h_l1628_c32_16cf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c7_b9ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1635_c7_7c89] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;

     -- t16_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1635_c7_7c89_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- t16_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1630_c7_e99e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1630_c7_e99e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1624_c7_926c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1624_c7_926c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1621_c7_0b2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1621_c7_0b2a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1616_c7_e4ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1616_c7_e4ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_d97e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1613_c7_d97e_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1607_c2_2e4a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1650_l1602_DUPLICATE_9dbb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1650_l1602_DUPLICATE_9dbb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1607_c2_2e4a_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1650_l1602_DUPLICATE_9dbb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1650_l1602_DUPLICATE_9dbb_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
