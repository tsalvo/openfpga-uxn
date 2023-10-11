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
-- Submodules: 59
entity str1_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_1c7b7172;
architecture arch of str1_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_0a03]
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1813_c1_5a18]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1813_c2_7ef0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1814_c3_f418[uxn_opcodes_h_l1814_c3_f418]
signal printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_9935]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_68a4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_9b7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1821_c7_463c]
signal n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1821_c7_463c]
signal t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_463c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_b533]
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1825_c7_bdd6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_b92d]
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1828_c7_5ead]
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1831_c32_3d45]
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1831_c32_8d67]
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1831_c32_a949]
signal MUX_uxn_opcodes_h_l1831_c32_a949_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_a949_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_a949_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1831_c32_a949_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1833_c21_34df]
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_163b]
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_c321]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_c321]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_c321]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_6a81( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.ram_addr := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right,
BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output);

-- n8_MUX_uxn_opcodes_h_l1813_c2_7ef0
n8_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- t8_MUX_uxn_opcodes_h_l1813_c2_7ef0
t8_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

-- printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418
printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418 : entity work.printf_uxn_opcodes_h_l1814_c3_f418_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output);

-- n8_MUX_uxn_opcodes_h_l1818_c7_68a4
n8_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- t8_MUX_uxn_opcodes_h_l1818_c7_68a4
t8_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output);

-- n8_MUX_uxn_opcodes_h_l1821_c7_463c
n8_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- t8_MUX_uxn_opcodes_h_l1821_c7_463c
t8_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right,
BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output);

-- n8_MUX_uxn_opcodes_h_l1825_c7_bdd6
n8_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right,
BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output);

-- n8_MUX_uxn_opcodes_h_l1828_c7_5ead
n8_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45
BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left,
BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right,
BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67
BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left,
BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right,
BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output);

-- MUX_uxn_opcodes_h_l1831_c32_a949
MUX_uxn_opcodes_h_l1831_c32_a949 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1831_c32_a949_cond,
MUX_uxn_opcodes_h_l1831_c32_a949_iftrue,
MUX_uxn_opcodes_h_l1831_c32_a949_iffalse,
MUX_uxn_opcodes_h_l1831_c32_a949_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output,
 n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output,
 n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output,
 n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output,
 n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output,
 n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output,
 MUX_uxn_opcodes_h_l1831_c32_a949_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_45f3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_818a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_55de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_d4ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_bdd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_5200 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_a949_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1831_c32_a949_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_0f50_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1843_l1809_DUPLICATE_af65_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_45f3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_45f3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_818a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_818a;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_d4ac := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1826_c3_d4ac;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_55de := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1823_c3_55de;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right := to_unsigned(4, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1825_c11_b533] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_left;
     BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output := BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_163b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_9b7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_bdd6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_9935] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1813_c6_0a03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_left;
     BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output := BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1828_c11_b92d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1831_c32_3d45] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_left;
     BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output := BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1833_c26_0f50] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_0f50_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1831_c32_3d45_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1813_c6_0a03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_9935_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_9b7a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1825_c11_b533_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1828_c11_b92d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_163b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1833_c26_0f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_c336_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_d537_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1818_l1836_l1828_l1825_l1821_DUPLICATE_4d3a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_c29a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1818_l1813_l1836_l1825_l1821_DUPLICATE_46d9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1818_l1813_l1828_l1825_l1821_DUPLICATE_0457_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_c321] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_c321] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1836_c7_c321] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;

     -- n8_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1831_c32_8d67] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_left;
     BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output := BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1833_c21_34df] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1813_c1_5a18] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1831_c32_a949_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1831_c32_8d67_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_5200 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c21_34df_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1813_c1_5a18_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1836_c7_c321_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1833_c3_5200;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- MUX[uxn_opcodes_h_l1831_c32_a949] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1831_c32_a949_cond <= VAR_MUX_uxn_opcodes_h_l1831_c32_a949_cond;
     MUX_uxn_opcodes_h_l1831_c32_a949_iftrue <= VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iftrue;
     MUX_uxn_opcodes_h_l1831_c32_a949_iffalse <= VAR_MUX_uxn_opcodes_h_l1831_c32_a949_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1831_c32_a949_return_output := MUX_uxn_opcodes_h_l1831_c32_a949_return_output;

     -- printf_uxn_opcodes_h_l1814_c3_f418[uxn_opcodes_h_l1814_c3_f418] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1814_c3_f418_uxn_opcodes_h_l1814_c3_f418_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- t8_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue := VAR_MUX_uxn_opcodes_h_l1831_c32_a949_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- t8_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- n8_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1828_c7_5ead] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1828_c7_5ead_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1825_c7_bdd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1825_c7_bdd6_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- n8_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_463c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_463c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_68a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_68a4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1813_c2_7ef0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1843_l1809_DUPLICATE_af65 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1843_l1809_DUPLICATE_af65_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1813_c2_7ef0_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1843_l1809_DUPLICATE_af65_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1843_l1809_DUPLICATE_af65_return_output;
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
