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
-- BIN_OP_EQ[uxn_opcodes_h_l1680_c6_796b]
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1680_c1_8c77]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1680_c2_72a0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1681_c3_bd60[uxn_opcodes_h_l1681_c3_bd60]
signal printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_ccce]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1685_c7_3bc0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_50c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1688_c7_c833]
signal t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1688_c7_c833]
signal n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_c833]
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_51cd]
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1692_c7_baa6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_184e]
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1695_c7_0bd2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1697_c3_55ab]
signal CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_8292]
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1700_c7_51ee]
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_2440]
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1703_c7_c29f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1704_c3_4e47]
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1706_c32_735e]
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1706_c32_4b4e]
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1706_c32_8f79]
signal MUX_uxn_opcodes_h_l1706_c32_8f79_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1706_c32_8f79_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1709_c32_d067]
signal CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1711_c11_b73b]
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1711_c7_dbd4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1711_c7_dbd4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1711_c7_dbd4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1711_c7_dbd4]
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1711_c7_dbd4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1713_c32_c533]
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_4c4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_5fe7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_5fe7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left,
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right,
BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output);

-- t8_MUX_uxn_opcodes_h_l1680_c2_72a0
t8_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- n16_MUX_uxn_opcodes_h_l1680_c2_72a0
n16_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

-- printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60
printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60 : entity work.printf_uxn_opcodes_h_l1681_c3_bd60_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output);

-- t8_MUX_uxn_opcodes_h_l1685_c7_3bc0
t8_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- n16_MUX_uxn_opcodes_h_l1685_c7_3bc0
n16_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output);

-- t8_MUX_uxn_opcodes_h_l1688_c7_c833
t8_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- n16_MUX_uxn_opcodes_h_l1688_c7_c833
n16_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right,
BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output);

-- n16_MUX_uxn_opcodes_h_l1692_c7_baa6
n16_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right,
BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output);

-- n16_MUX_uxn_opcodes_h_l1695_c7_0bd2
n16_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab
CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x,
CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right,
BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output);

-- n16_MUX_uxn_opcodes_h_l1700_c7_51ee
n16_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right,
BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output);

-- n16_MUX_uxn_opcodes_h_l1703_c7_c29f
n16_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47
BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left,
BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right,
BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e
BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left,
BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right,
BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e
BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left,
BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right,
BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output);

-- MUX_uxn_opcodes_h_l1706_c32_8f79
MUX_uxn_opcodes_h_l1706_c32_8f79 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1706_c32_8f79_cond,
MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue,
MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse,
MUX_uxn_opcodes_h_l1706_c32_8f79_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1709_c32_d067
CONST_SR_8_uxn_opcodes_h_l1709_c32_d067 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x,
CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left,
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right,
BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left,
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right,
BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output,
 t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output,
 t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output,
 t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output,
 n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output,
 n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output,
 CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output,
 n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output,
 n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output,
 MUX_uxn_opcodes_h_l1706_c32_8f79_return_output,
 CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_ccd7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_c6c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_f399 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8f67 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7095 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7838 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_51ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_3053_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_d875_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_6983_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_82f2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1696_l1704_DUPLICATE_2783_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1721_l1674_DUPLICATE_a49a_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_ccd7 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_ccd7;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8f67 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1693_c3_8f67;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_c6c6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1686_c3_c6c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7095 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1698_c3_7095;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7838 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1701_c3_7838;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_f399 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1690_c3_f399;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output := result.ram_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1708_c21_3053] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_3053_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output := result.is_ram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1714_c22_82f2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_82f2_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1695_c11_184e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_ccce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1706_c32_735e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_left;
     BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output := BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1688_c11_50c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1680_c6_796b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1696_l1704_DUPLICATE_2783 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1696_l1704_DUPLICATE_2783_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1700_c11_8292] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_left;
     BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output := BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1703_c11_2440] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_left;
     BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output := BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1711_c11_b73b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1716_c11_4c4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1692_c11_51cd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_51ee_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1713_c32_c533] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1706_c32_735e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1680_c6_796b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_ccce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1688_c11_50c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1692_c11_51cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1695_c11_184e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1700_c11_8292_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1703_c11_2440_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1711_c11_b73b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1716_c11_4c4c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1708_c21_3053_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1696_l1704_DUPLICATE_2783_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1696_l1704_DUPLICATE_2783_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1714_c22_82f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1680_l1703_DUPLICATE_9d74_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_5ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1703_DUPLICATE_a80e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1716_l1685_l1711_l1680_DUPLICATE_c89b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_e719_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1700_l1695_l1692_l1688_l1685_l1711_l1680_DUPLICATE_82cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1700_c7_51ee_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1711_c7_dbd4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output := result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1680_c1_8c77] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1704_c3_4e47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_left;
     BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output := BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1716_c7_5fe7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1716_c7_5fe7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1697_c3_55ab] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output := CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1706_c32_4b4e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_left;
     BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output := BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1711_c7_dbd4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1713_c21_6983] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_6983_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1713_c32_c533_return_output);

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1706_c32_4b4e_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1704_c3_4e47_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1713_c21_6983_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1697_c3_55ab_return_output;
     VAR_printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1680_c1_8c77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1716_c7_5fe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     -- MUX[uxn_opcodes_h_l1706_c32_8f79] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1706_c32_8f79_cond <= VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_cond;
     MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue <= VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iftrue;
     MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse <= VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_return_output := MUX_uxn_opcodes_h_l1706_c32_8f79_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1711_c7_dbd4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1711_c7_dbd4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- printf_uxn_opcodes_h_l1681_c3_bd60[uxn_opcodes_h_l1681_c3_bd60] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1681_c3_bd60_uxn_opcodes_h_l1681_c3_bd60_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1711_c7_dbd4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1709_c32_d067] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output := CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output;

     -- n16_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := VAR_MUX_uxn_opcodes_h_l1706_c32_8f79_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1711_c7_dbd4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1709_c22_d875] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_d875_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1709_c32_d067_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- n16_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1709_c22_d875_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1703_c7_c29f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1703_c7_c29f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1700_c7_51ee] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output := result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- n16_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1700_c7_51ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     -- n16_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1695_c7_0bd2] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output := result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1695_c7_0bd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     -- n16_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1692_c7_baa6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1692_c7_baa6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1688_c7_c833] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output := result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1688_c7_c833_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1685_c7_3bc0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- Submodule level 10
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1685_c7_3bc0_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1680_c2_72a0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1721_l1674_DUPLICATE_a49a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1721_l1674_DUPLICATE_a49a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1680_c2_72a0_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1721_l1674_DUPLICATE_a49a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1721_l1674_DUPLICATE_a49a_return_output;
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
