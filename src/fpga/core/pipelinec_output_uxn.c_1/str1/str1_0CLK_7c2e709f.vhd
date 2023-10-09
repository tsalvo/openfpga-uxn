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
-- Submodules: 64
entity str1_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str1_0CLK_7c2e709f;
architecture arch of str1_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1905_c6_9d0c]
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1905_c1_5d0d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1905_c2_c62a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1906_c3_4179[uxn_opcodes_h_l1906_c3_4179]
signal printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_ccce]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1911_c7_fd16]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_2609]
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1914_c7_ef03]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1918_c11_8a66]
signal BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1918_c7_cae1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_925a]
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1921_c7_f827]
signal n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1921_c7_f827]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1925_c32_d0bd]
signal BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1925_c32_0c75]
signal BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1925_c32_5044]
signal MUX_uxn_opcodes_h_l1925_c32_5044_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1925_c32_5044_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1925_c32_5044_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1925_c32_5044_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1927_c21_7f54]
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_5521]
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_c88e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1930_c7_c88e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1930_c7_c88e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fd01( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.ram_value := ref_toks_1;
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_write := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c
BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left,
BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right,
BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output);

-- t8_MUX_uxn_opcodes_h_l1905_c2_c62a
t8_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- n8_MUX_uxn_opcodes_h_l1905_c2_c62a
n8_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a
result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a
result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a
result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a
result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a
result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

-- printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179
printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179 : entity work.printf_uxn_opcodes_h_l1906_c3_4179_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output);

-- t8_MUX_uxn_opcodes_h_l1911_c7_fd16
t8_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- n8_MUX_uxn_opcodes_h_l1911_c7_fd16
n8_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16
result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16
result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right,
BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output);

-- t8_MUX_uxn_opcodes_h_l1914_c7_ef03
t8_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- n8_MUX_uxn_opcodes_h_l1914_c7_ef03
n8_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03
result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03
result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66
BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left,
BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right,
BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output);

-- n8_MUX_uxn_opcodes_h_l1918_c7_cae1
n8_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1
result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1
result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1
result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1
result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1
result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1
result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output);

-- n8_MUX_uxn_opcodes_h_l1921_c7_f827
n8_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827
result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827
result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827
result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827
result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd
BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left,
BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right,
BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75
BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left,
BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right,
BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output);

-- MUX_uxn_opcodes_h_l1925_c32_5044
MUX_uxn_opcodes_h_l1925_c32_5044 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1925_c32_5044_cond,
MUX_uxn_opcodes_h_l1925_c32_5044_iftrue,
MUX_uxn_opcodes_h_l1925_c32_5044_iffalse,
MUX_uxn_opcodes_h_l1925_c32_5044_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left,
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right,
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right,
BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e
result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output,
 t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output,
 t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output,
 t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output,
 n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output,
 n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output,
 MUX_uxn_opcodes_h_l1925_c32_5044_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_8b1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_e19a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1916_c3_f790 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1919_c3_e9ae : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1918_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_64e6 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c32_5044_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1925_c32_5044_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1927_c26_52ce_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1937_l1901_DUPLICATE_1bf6_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1916_c3_f790 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1916_c3_f790;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_8b1d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1908_c3_8b1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1919_c3_e9ae := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1919_c3_e9ae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_e19a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1912_c3_e19a;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := n8;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_ccce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output := result.is_opc_done;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1927_c26_52ce] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1927_c26_52ce_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_AND[uxn_opcodes_h_l1925_c32_d0bd] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_left;
     BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output := BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1918_c7_cae1_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1914_c11_2609] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_left;
     BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output := BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1905_c6_9d0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1918_c11_8a66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_left;
     BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output := BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output := result.ram_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_925a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1930_c11_5521] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_left;
     BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output := BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1925_c32_d0bd_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1905_c6_9d0c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_ccce_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1914_c11_2609_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1918_c11_8a66_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_925a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1930_c11_5521_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1927_c26_52ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_afe9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_52ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1911_l1930_l1921_l1918_l1914_DUPLICATE_0d09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_0230_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1911_l1905_l1930_l1918_l1914_DUPLICATE_a652_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1918_l1911_l1921_l1914_DUPLICATE_75e6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1911_l1905_l1921_l1918_l1914_DUPLICATE_cc01_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1918_c7_cae1_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1930_c7_c88e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- t8_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1930_c7_c88e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1905_c1_5d0d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1925_c32_0c75] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_left;
     BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output := BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1930_c7_c88e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1927_c21_7f54] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1925_c32_5044_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1925_c32_0c75_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_64e6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_7f54_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1905_c1_5d0d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1930_c7_c88e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_64e6;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- MUX[uxn_opcodes_h_l1925_c32_5044] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1925_c32_5044_cond <= VAR_MUX_uxn_opcodes_h_l1925_c32_5044_cond;
     MUX_uxn_opcodes_h_l1925_c32_5044_iftrue <= VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iftrue;
     MUX_uxn_opcodes_h_l1925_c32_5044_iffalse <= VAR_MUX_uxn_opcodes_h_l1925_c32_5044_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1925_c32_5044_return_output := MUX_uxn_opcodes_h_l1925_c32_5044_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- printf_uxn_opcodes_h_l1906_c3_4179[uxn_opcodes_h_l1906_c3_4179] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1906_c3_4179_uxn_opcodes_h_l1906_c3_4179_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_value_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- t8_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue := VAR_MUX_uxn_opcodes_h_l1925_c32_5044_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1921_c7_f827] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- t8_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- n8_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1921_c7_f827_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1918_c7_cae1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1918_c7_cae1_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1914_c7_ef03] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- n8_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1914_c7_ef03_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_fd16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_fd16_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1905_c2_c62a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1937_l1901_DUPLICATE_1bf6 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1937_l1901_DUPLICATE_1bf6_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1905_c2_c62a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1937_l1901_DUPLICATE_1bf6_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1937_l1901_DUPLICATE_1bf6_return_output;
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
