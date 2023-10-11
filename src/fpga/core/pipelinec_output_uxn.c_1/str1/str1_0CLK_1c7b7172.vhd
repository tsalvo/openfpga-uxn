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
-- BIN_OP_EQ[uxn_opcodes_h_l1809_c6_e5fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1809_c1_5bfa]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1809_c2_4f68]
signal n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1810_c3_c436[uxn_opcodes_h_l1810_c3_c436]
signal printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_ac04]
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1814_c7_20a3]
signal n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_2f45]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1817_c7_6c2a]
signal n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_56fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_c765]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1821_c7_c765]
signal n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_cb9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1824_c7_b9a6]
signal n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1827_c32_cfa3]
signal BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1827_c32_2104]
signal BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1827_c32_ae85]
signal MUX_uxn_opcodes_h_l1827_c32_ae85_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1827_c32_ae85_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1829_c21_9bf2]
signal BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_f5cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_8f6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_8f6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_8f6a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output);

-- t8_MUX_uxn_opcodes_h_l1809_c2_4f68
t8_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68
result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68
result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- n8_MUX_uxn_opcodes_h_l1809_c2_4f68
n8_MUX_uxn_opcodes_h_l1809_c2_4f68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond,
n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue,
n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse,
n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

-- printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436
printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436 : entity work.printf_uxn_opcodes_h_l1810_c3_c436_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right,
BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output);

-- t8_MUX_uxn_opcodes_h_l1814_c7_20a3
t8_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3
result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3
result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3
result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- n8_MUX_uxn_opcodes_h_l1814_c7_20a3
n8_MUX_uxn_opcodes_h_l1814_c7_20a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond,
n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue,
n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse,
n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output);

-- t8_MUX_uxn_opcodes_h_l1817_c7_6c2a
t8_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- n8_MUX_uxn_opcodes_h_l1817_c7_6c2a
n8_MUX_uxn_opcodes_h_l1817_c7_6c2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond,
n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue,
n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse,
n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- n8_MUX_uxn_opcodes_h_l1821_c7_c765
n8_MUX_uxn_opcodes_h_l1821_c7_c765 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond,
n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue,
n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse,
n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- n8_MUX_uxn_opcodes_h_l1824_c7_b9a6
n8_MUX_uxn_opcodes_h_l1824_c7_b9a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond,
n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue,
n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse,
n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3
BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left,
BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right,
BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104
BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left,
BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right,
BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output);

-- MUX_uxn_opcodes_h_l1827_c32_ae85
MUX_uxn_opcodes_h_l1827_c32_ae85 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1827_c32_ae85_cond,
MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue,
MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse,
MUX_uxn_opcodes_h_l1827_c32_ae85_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2
BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left,
BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right,
BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output,
 t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output,
 t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output,
 t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output,
 MUX_uxn_opcodes_h_l1827_c32_ae85_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_2e83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_9f6e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7b1e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_7cf4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1821_c7_c765_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1829_c3_5465 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1829_c26_2692_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1839_l1805_DUPLICATE_16fe_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_9f6e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_9f6e;
     VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_2e83 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1811_c3_2e83;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_7cf4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1822_c3_7cf4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7b1e := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_7b1e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_2f45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output := result.is_ram_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1829_c26_2692] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1829_c26_2692_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1824_c11_cb9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_f5cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1814_c11_ac04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_left;
     BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output := BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_56fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output := result.ram_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1821_c7_c765_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1809_c6_e5fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output := result.ram_addr;

     -- BIN_OP_AND[uxn_opcodes_h_l1827_c32_cfa3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_left;
     BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output := BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1827_c32_cfa3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_e5fc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1814_c11_ac04_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_2f45_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_56fd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1824_c11_cb9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_f5cd_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1829_c26_2692_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_a6b7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_39d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1814_l1832_l1824_l1821_DUPLICATE_290b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_65ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1832_l1821_DUPLICATE_a253_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1814_l1809_l1824_l1821_DUPLICATE_4fc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1821_c7_c765_return_output;
     -- t8_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_8f6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_8f6a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1809_c1_5bfa] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1827_c32_2104] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_left;
     BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output := BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1832_c7_8f6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- n8_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1829_c21_9bf2] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1827_c32_2104_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1829_c3_5465 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1829_c21_9bf2_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_5bfa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1832_c7_8f6a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1829_c3_5465;
     -- t8_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- printf_uxn_opcodes_h_l1810_c3_c436[uxn_opcodes_h_l1810_c3_c436] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1810_c3_c436_uxn_opcodes_h_l1810_c3_c436_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_value_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- MUX[uxn_opcodes_h_l1827_c32_ae85] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1827_c32_ae85_cond <= VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_cond;
     MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue <= VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iftrue;
     MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse <= VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_return_output := MUX_uxn_opcodes_h_l1827_c32_ae85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- n8_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue := VAR_MUX_uxn_opcodes_h_l1827_c32_ae85_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- t8_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- n8_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1824_c7_b9a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1824_c7_b9a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_c765] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_c765_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_6c2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_6c2a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1814_c7_20a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1814_c7_20a3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c2_4f68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1839_l1805_DUPLICATE_16fe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1839_l1805_DUPLICATE_16fe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c2_4f68_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1839_l1805_DUPLICATE_16fe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1839_l1805_DUPLICATE_16fe_return_output;
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
