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
-- Submodules: 101
entity str2_0CLK_05af43a3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_05af43a3;
architecture arch of str2_0CLK_05af43a3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1986_c6_0638]
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1986_c1_a7d8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1986_c2_1c04]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1987_c3_abaf[uxn_opcodes_h_l1987_c3_abaf]
signal printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1992_c11_5bce]
signal BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1992_c7_0425]
signal t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1992_c7_0425]
signal n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1992_c7_0425]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1995_c11_4d84]
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1995_c7_d5d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_0490]
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1999_c7_cd2a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_4112]
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2002_c7_7d93]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2004_c3_5228]
signal CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_4e95]
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2007_c7_2c9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_d5de]
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2010_c7_64dd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2011_c3_8fde]
signal BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2014_c32_bb83]
signal BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2014_c32_a590]
signal BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2014_c32_69eb]
signal MUX_uxn_opcodes_h_l2014_c32_69eb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2014_c32_69eb_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_86ad]
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_5dfe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2016_c7_5dfe]
signal result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2016_c7_5dfe]
signal result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_5dfe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2016_c7_5dfe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2020_c32_cffb]
signal CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_d6c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2022_c7_578d]
signal result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2022_c7_578d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2022_c7_578d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2022_c7_578d]
signal result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2023_c21_26bd]
signal BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_3531]
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_70a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2026_c7_70a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638
BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left,
BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right,
BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output);

-- t8_MUX_uxn_opcodes_h_l1986_c2_1c04
t8_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- n16_MUX_uxn_opcodes_h_l1986_c2_1c04
n16_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04
result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04
result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04
result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

-- printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf
printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf : entity work.printf_uxn_opcodes_h_l1987_c3_abaf_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce
BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left,
BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right,
BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output);

-- t8_MUX_uxn_opcodes_h_l1992_c7_0425
t8_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- n16_MUX_uxn_opcodes_h_l1992_c7_0425
n16_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425
result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425
result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425
result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425
result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425
result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425
result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425
result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left,
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right,
BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output);

-- t8_MUX_uxn_opcodes_h_l1995_c7_d5d7
t8_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1995_c7_d5d7
n16_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right,
BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output);

-- n16_MUX_uxn_opcodes_h_l1999_c7_cd2a
n16_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a
result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right,
BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output);

-- n16_MUX_uxn_opcodes_h_l2002_c7_7d93
n16_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93
result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93
result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93
result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93
result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2004_c3_5228
CONST_SL_8_uxn_opcodes_h_l2004_c3_5228 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x,
CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right,
BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output);

-- n16_MUX_uxn_opcodes_h_l2007_c7_2c9f
n16_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right,
BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output);

-- n16_MUX_uxn_opcodes_h_l2010_c7_64dd
n16_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd
result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd
result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd
result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd
result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde
BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left,
BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right,
BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83
BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left,
BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right,
BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590
BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left,
BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right,
BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output);

-- MUX_uxn_opcodes_h_l2014_c32_69eb
MUX_uxn_opcodes_h_l2014_c32_69eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2014_c32_69eb_cond,
MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue,
MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse,
MUX_uxn_opcodes_h_l2014_c32_69eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right,
BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe
result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe
result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond,
result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe
result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb
CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x,
CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d
result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d
result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond,
result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd
BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left,
BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right,
BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right,
BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5
result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output,
 t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output,
 t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output,
 t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output,
 n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output,
 n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output,
 CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output,
 n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output,
 n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output,
 MUX_uxn_opcodes_h_l2014_c32_69eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output,
 CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1989_c3_f481 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_c0ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1997_c3_1c54 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_2fa4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_585c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_3950 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_c7_2c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2019_c3_e22c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2020_c22_8f97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2023_c3_c307 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2024_c22_fa44_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2011_DUPLICATE_deee_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_6023_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2031_l1981_DUPLICATE_88f4_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_585c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2005_c3_585c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_2fa4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2000_c3_2fa4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1989_c3_f481 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1989_c3_f481;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_c0ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1993_c3_c0ad;
     VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_3950 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2008_c3_3950;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1997_c3_1c54 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1997_c3_1c54;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := t8;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_c7_2c9f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2010_c11_d5de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_left;
     BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output := BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output := result.ram_addr;

     -- CONST_SR_8[uxn_opcodes_h_l2020_c32_cffb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output := CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2014_c32_bb83] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_left;
     BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output := BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2011_DUPLICATE_deee LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2011_DUPLICATE_deee_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2002_c11_4112] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_left;
     BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output := BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2022_c11_d6c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2024_c22_fa44] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2024_c22_fa44_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1995_c11_4d84] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_left;
     BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output := BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1986_c6_0638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_left;
     BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output := BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_6023 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_6023_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l2007_c11_4e95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1999_c11_0490] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_left;
     BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output := BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1992_c11_5bce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2026_c11_3531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_left;
     BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output := BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2016_c11_86ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2014_c32_bb83_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c6_0638_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1992_c11_5bce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1995_c11_4d84_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1999_c11_0490_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2002_c11_4112_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2007_c11_4e95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2010_c11_d5de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2016_c11_86ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2022_c11_d6c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2026_c11_3531_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_6023_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2011_DUPLICATE_deee_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2003_l2011_DUPLICATE_deee_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2024_c22_fa44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e25f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_6f05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_l2016_DUPLICATE_b6cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l2026_l1995_l2022_l1992_DUPLICATE_ecc6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1986_l2007_l2002_l1999_l1995_l1992_l2016_DUPLICATE_4981_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2010_l2007_l2002_l1999_l1995_l1992_DUPLICATE_e7a1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1986_l2010_l2007_l2002_l1999_l1995_l2022_l1992_DUPLICATE_b289_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2016_c7_5dfe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2014_c32_a590] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_left;
     BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output := BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2004_c3_5228] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output := CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2026_c7_70a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2020_c22_8f97] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2020_c22_8f97_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2020_c32_cffb_return_output);

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1986_c1_a7d8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2026_c7_70a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2011_c3_8fde] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_left;
     BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output := BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2022_c7_578d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output := result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2014_c32_a590_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2011_c3_8fde_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2019_c3_e22c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l2023_l2019_DUPLICATE_8531_return_output)),16);
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2020_c22_8f97_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2004_c3_5228_return_output;
     VAR_printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1986_c1_a7d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2026_c7_70a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2019_c3_e22c;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2022_c7_578d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- MUX[uxn_opcodes_h_l2014_c32_69eb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2014_c32_69eb_cond <= VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_cond;
     MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue <= VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iftrue;
     MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse <= VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_return_output := MUX_uxn_opcodes_h_l2014_c32_69eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- printf_uxn_opcodes_h_l1987_c3_abaf[uxn_opcodes_h_l1987_c3_abaf] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1987_c3_abaf_uxn_opcodes_h_l1987_c3_abaf_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_value_MUX[uxn_opcodes_h_l2016_c7_5dfe] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output := result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2023_c21_26bd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2022_c7_578d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l2023_c3_c307 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2023_c21_26bd_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue := VAR_MUX_uxn_opcodes_h_l2014_c32_69eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2023_c3_c307;
     -- result_ram_value_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2022_c7_578d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2016_c7_5dfe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2016_c7_5dfe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2022_c7_578d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- n16_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2016_c7_5dfe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2016_c7_5dfe_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2010_c7_64dd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- n16_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2010_c7_64dd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2007_c7_2c9f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2007_c7_2c9f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2002_c7_7d93] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2002_c7_7d93_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- n16_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1999_c7_cd2a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1999_c7_cd2a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1995_c7_d5d7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1995_c7_d5d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1992_c7_0425] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- Submodule level 11
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1992_c7_0425_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1986_c2_1c04] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2031_l1981_DUPLICATE_88f4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2031_l1981_DUPLICATE_88f4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1986_c2_1c04_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2031_l1981_DUPLICATE_88f4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l2031_l1981_DUPLICATE_88f4_return_output;
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
