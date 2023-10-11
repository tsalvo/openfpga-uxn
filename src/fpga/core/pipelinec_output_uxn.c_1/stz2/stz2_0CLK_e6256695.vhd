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
entity stz2_0CLK_e6256695 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_e6256695;
architecture arch of stz2_0CLK_e6256695 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1676_c6_b6f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1676_c1_6b13]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1676_c2_3172]
signal t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1676_c2_3172]
signal n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1676_c2_3172]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1677_c3_a893[uxn_opcodes_h_l1677_c3_a893]
signal printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1681_c11_c0ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1681_c7_62cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1684_c11_b291]
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1684_c7_aa4e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_0021]
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_abdb]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_66c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1691_c7_26b6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1693_c3_5066]
signal CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_e811]
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_ae8e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_b392]
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_ea30]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1700_c3_1e76]
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1702_c32_0608]
signal BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1702_c32_7621]
signal BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1702_c32_76b3]
signal MUX_uxn_opcodes_h_l1702_c32_76b3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1702_c32_76b3_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1705_c32_5783]
signal CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_fdea]
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_d509]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1707_c7_d509]
signal result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_d509]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1707_c7_d509]
signal result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1707_c7_d509]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1709_c32_2ff3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_b372]
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_9297]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_9297]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output : unsigned(0 downto 0);

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

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.ram_addr := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.ram_value := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1
BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output);

-- t8_MUX_uxn_opcodes_h_l1676_c2_3172
t8_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- n16_MUX_uxn_opcodes_h_l1676_c2_3172
n16_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172
result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172
result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172
result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

-- printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893
printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893 : entity work.printf_uxn_opcodes_h_l1677_c3_a893_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output);

-- t8_MUX_uxn_opcodes_h_l1681_c7_62cc
t8_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1681_c7_62cc
n16_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc
result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc
result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc
result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left,
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right,
BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output);

-- t8_MUX_uxn_opcodes_h_l1684_c7_aa4e
t8_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- n16_MUX_uxn_opcodes_h_l1684_c7_aa4e
n16_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e
result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output);

-- n16_MUX_uxn_opcodes_h_l1688_c7_abdb
n16_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output);

-- n16_MUX_uxn_opcodes_h_l1691_c7_26b6
n16_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6
result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6
result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1693_c3_5066
CONST_SL_8_uxn_opcodes_h_l1693_c3_5066 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x,
CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right,
BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output);

-- n16_MUX_uxn_opcodes_h_l1696_c7_ae8e
n16_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right,
BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output);

-- n16_MUX_uxn_opcodes_h_l1699_c7_ea30
n16_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30
result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30
result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76
BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left,
BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right,
BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608
BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left,
BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right,
BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621
BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left,
BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right,
BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output);

-- MUX_uxn_opcodes_h_l1702_c32_76b3
MUX_uxn_opcodes_h_l1702_c32_76b3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1702_c32_76b3_cond,
MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue,
MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse,
MUX_uxn_opcodes_h_l1702_c32_76b3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1705_c32_5783
CONST_SR_8_uxn_opcodes_h_l1705_c32_5783 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x,
CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right,
BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509
result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509
result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond,
result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509
result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3
BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right,
BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output,
 t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output,
 t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output,
 t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output,
 n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output,
 n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output,
 CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output,
 n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output,
 n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output,
 MUX_uxn_opcodes_h_l1702_c32_76b3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1678_c3_bebe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_1015 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_0a22 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_c0b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1694_c3_a888 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_65bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_ae8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1704_c21_4974_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1705_c22_c586_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1709_c21_5461_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1710_c22_2e5c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1700_l1692_DUPLICATE_1444_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1717_l1670_DUPLICATE_8d60_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1694_c3_a888 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1694_c3_a888;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1678_c3_bebe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1678_c3_bebe;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right := to_unsigned(8, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_1015 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_1015;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_0a22 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_0a22;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_c0b7 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1689_c3_c0b7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_65bd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1697_c3_65bd;
     VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1699_c11_b392] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_left;
     BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output := BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1681_c11_c0ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1696_c11_e811] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_left;
     BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output := BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_0021] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_left;
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output := BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1707_c11_fdea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_left;
     BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output := BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1684_c11_b291] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_left;
     BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output := BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1691_c11_66c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_ae8e_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1700_l1692_DUPLICATE_1444 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1700_l1692_DUPLICATE_1444_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c6_b6f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output := result.is_ram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1710_c22_2e5c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1710_c22_2e5c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_AND[uxn_opcodes_h_l1702_c32_0608] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_left;
     BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output := BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1704_c21_4974] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1704_c21_4974_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output := result.ram_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1709_c32_2ff3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1712_c11_b372] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_left;
     BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output := BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1702_c32_0608_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c6_b6f1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1681_c11_c0ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1684_c11_b291_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_0021_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c11_66c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1696_c11_e811_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1699_c11_b392_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1707_c11_fdea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1712_c11_b372_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1704_c21_4974_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1700_l1692_DUPLICATE_1444_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1700_l1692_DUPLICATE_1444_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1710_c22_2e5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1676_l1699_l1696_l1691_l1688_l1684_l1681_DUPLICATE_e569_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_c557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1699_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_ef4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1712_l1681_l1707_DUPLICATE_106d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_9d4a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1676_l1696_l1691_l1688_l1684_l1681_l1707_DUPLICATE_1471_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1707_c7_d509] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1702_c32_7621] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_left;
     BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output := BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output;

     -- t8_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1707_c7_d509] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output := result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1712_c7_9297] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1700_c3_1e76] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_left;
     BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output := BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1709_c21_5461] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1709_c21_5461_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1709_c32_2ff3_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1676_c1_6b13] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1712_c7_9297] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1693_c3_5066] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output := CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1702_c32_7621_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1700_c3_1e76_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1709_c21_5461_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1693_c3_5066_return_output;
     VAR_printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1676_c1_6b13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1712_c7_9297_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1712_c7_9297_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- n16_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1707_c7_d509] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;

     -- printf_uxn_opcodes_h_l1677_c3_a893[uxn_opcodes_h_l1677_c3_a893] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1677_c3_a893_uxn_opcodes_h_l1677_c3_a893_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1702_c32_76b3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1702_c32_76b3_cond <= VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_cond;
     MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue <= VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iftrue;
     MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse <= VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_return_output := MUX_uxn_opcodes_h_l1702_c32_76b3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1705_c32_5783] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output := CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output;

     -- t8_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1707_c7_d509] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1707_c7_d509] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := VAR_MUX_uxn_opcodes_h_l1702_c32_76b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1707_c7_d509_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- t8_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1705_c22_c586] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1705_c22_c586_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1705_c32_5783_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- n16_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1705_c22_c586_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1699_c7_ea30] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output := result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1699_c7_ea30_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1696_c7_ae8e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1696_c7_ae8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1691_c7_26b6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1691_c7_26b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_abdb] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output := result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_abdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1684_c7_aa4e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1684_c7_aa4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1681_c7_62cc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output := result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- Submodule level 10
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1681_c7_62cc_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1676_c2_3172] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output := result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1717_l1670_DUPLICATE_8d60 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1717_l1670_DUPLICATE_8d60_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1676_c2_3172_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1676_c2_3172_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1717_l1670_DUPLICATE_8d60_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1717_l1670_DUPLICATE_8d60_return_output;
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
