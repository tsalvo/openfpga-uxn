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
-- Submodules: 89
entity str2_0CLK_e6256695 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_e6256695;
architecture arch of str2_0CLK_e6256695 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1851_c6_d46e]
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c1_4d73]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1851_c2_25b4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1852_c3_cc23[uxn_opcodes_h_l1852_c3_cc23]
signal printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_bf1e]
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1856_c7_f87c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_33df]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_c52c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_00cb]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_7c35]
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_7891]
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1866_c7_5ba5]
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1868_c3_c515]
signal CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_6b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1871_c7_3c00]
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_ecb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_7de2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1875_c3_1560]
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1877_c32_0878]
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1877_c32_df58]
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1877_c32_e16b]
signal MUX_uxn_opcodes_h_l1877_c32_e16b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1877_c32_e16b_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1880_c32_5741]
signal CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_d074]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_bce4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1882_c7_bce4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_bce4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1882_c7_bce4]
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1882_c7_bce4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1884_c21_74fa]
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_a2ce]
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1887_c7_539d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_539d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left,
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right,
BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output);

-- t8_MUX_uxn_opcodes_h_l1851_c2_25b4
t8_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- n16_MUX_uxn_opcodes_h_l1851_c2_25b4
n16_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

-- printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23
printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23 : entity work.printf_uxn_opcodes_h_l1852_c3_cc23_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right,
BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output);

-- t8_MUX_uxn_opcodes_h_l1856_c7_f87c
t8_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- n16_MUX_uxn_opcodes_h_l1856_c7_f87c
n16_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output);

-- t8_MUX_uxn_opcodes_h_l1859_c7_c52c
t8_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- n16_MUX_uxn_opcodes_h_l1859_c7_c52c
n16_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output);

-- n16_MUX_uxn_opcodes_h_l1863_c7_7c35
n16_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right,
BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output);

-- n16_MUX_uxn_opcodes_h_l1866_c7_5ba5
n16_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1868_c3_c515
CONST_SL_8_uxn_opcodes_h_l1868_c3_c515 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x,
CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output);

-- n16_MUX_uxn_opcodes_h_l1871_c7_3c00
n16_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output);

-- n16_MUX_uxn_opcodes_h_l1874_c7_7de2
n16_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560
BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right,
BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878
BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left,
BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right,
BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58
BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left,
BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right,
BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output);

-- MUX_uxn_opcodes_h_l1877_c32_e16b
MUX_uxn_opcodes_h_l1877_c32_e16b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1877_c32_e16b_cond,
MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue,
MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse,
MUX_uxn_opcodes_h_l1877_c32_e16b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1880_c32_5741
CONST_SR_8_uxn_opcodes_h_l1880_c32_5741 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x,
CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left,
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right,
BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right,
BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output,
 t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output,
 t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output,
 t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output,
 n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output,
 n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output,
 n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output,
 n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output,
 MUX_uxn_opcodes_h_l1877_c32_e16b_return_output,
 CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_b48b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_40f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cd0c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_5742 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_8d91 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_71cf : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_3c00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_69a9 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_e160_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_8a7e : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_0d2f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_ebad_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1884_l1879_DUPLICATE_c2f6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1892_l1846_DUPLICATE_882a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_5742 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1864_c3_5742;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_71cf := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1872_c3_71cf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cd0c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1861_c3_cd0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_8d91 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1869_c3_8d91;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_b48b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_b48b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_40f4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_40f4;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1877_c32_0878] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_left;
     BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output := BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1866_c11_7891] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_left;
     BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output := BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1856_c11_bf1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_d074] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_3c00_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_6b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_ebad LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_ebad_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1885_c22_0d2f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_0d2f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_00cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1887_c11_a2ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1851_c6_d46e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_ecb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1884_l1879_DUPLICATE_c2f6 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1884_l1879_DUPLICATE_c2f6_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_33df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output := result.ram_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1877_c32_0878_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1851_c6_d46e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1856_c11_bf1e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_33df_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_00cb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1866_c11_7891_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_6b73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_ecb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_d074_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1887_c11_a2ce_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1884_l1879_DUPLICATE_c2f6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_ebad_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1867_l1875_DUPLICATE_ebad_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1885_c22_0d2f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1851_l1874_l1871_l1866_l1863_l1859_l1856_DUPLICATE_b7fe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d970_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1874_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_6178_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1887_l1856_l1882_DUPLICATE_4356_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_b7dd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1851_l1871_l1866_l1863_l1859_l1856_l1882_DUPLICATE_d269_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1871_c7_3c00_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1887_c7_539d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1875_c3_1560] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_left;
     BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output := BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1882_c7_bce4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1868_c3_c515] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output := CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1877_c32_df58] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_left;
     BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output := BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1882_c7_bce4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1887_c7_539d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1851_c1_4d73] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1877_c32_df58_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1875_c3_1560_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_69a9 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1879_l1884_DUPLICATE_19d2_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1868_c3_c515_return_output;
     VAR_printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1851_c1_4d73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1887_c7_539d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1887_c7_539d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1879_c3_69a9;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- t8_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1880_c32_5741] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output := CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_bce4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- MUX[uxn_opcodes_h_l1877_c32_e16b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1877_c32_e16b_cond <= VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_cond;
     MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue <= VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iftrue;
     MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse <= VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_return_output := MUX_uxn_opcodes_h_l1877_c32_e16b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1884_c21_74fa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1882_c7_bce4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;

     -- printf_uxn_opcodes_h_l1852_c3_cc23[uxn_opcodes_h_l1852_c3_cc23] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1852_c3_cc23_uxn_opcodes_h_l1852_c3_cc23_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_8a7e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1884_c21_74fa_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := VAR_MUX_uxn_opcodes_h_l1877_c32_e16b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1884_c3_8a7e;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1882_c7_bce4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;

     -- n16_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1880_c22_e160] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_e160_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1880_c32_5741_return_output);

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1880_c22_e160_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1882_c7_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- n16_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1874_c7_7de2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output := result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1874_c7_7de2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1871_c7_3c00] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- n16_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1871_c7_3c00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1866_c7_5ba5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1866_c7_5ba5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- n16_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1863_c7_7c35] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output := result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1863_c7_7c35_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_c52c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output := result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_c52c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1856_c7_f87c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- Submodule level 10
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1856_c7_f87c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1851_c2_25b4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1892_l1846_DUPLICATE_882a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1892_l1846_DUPLICATE_882a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1851_c2_25b4_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1892_l1846_DUPLICATE_882a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1892_l1846_DUPLICATE_882a_return_output;
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
