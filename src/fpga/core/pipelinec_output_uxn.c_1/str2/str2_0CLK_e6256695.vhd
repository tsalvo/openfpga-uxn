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
-- BIN_OP_EQ[uxn_opcodes_h_l1847_c6_7826]
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c1_fe0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1847_c2_34f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1848_c3_c3e4[uxn_opcodes_h_l1848_c3_c3e4]
signal printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1852_c11_2b25]
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1852_c7_08f1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_2020]
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1855_c7_0d40]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_6251]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_06ff]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_ba3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1862_c7_d293]
signal n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1862_c7_d293]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1864_c3_b0f3]
signal CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_3fc8]
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c7_dd71]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_9d3b]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1870_c7_f349]
signal n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1870_c7_f349]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1871_c3_c8b2]
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1873_c32_722d]
signal BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1873_c32_2665]
signal BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1873_c32_47ee]
signal MUX_uxn_opcodes_h_l1873_c32_47ee_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1873_c32_47ee_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1876_c32_87f7]
signal CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_11e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_35bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1878_c7_35bd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1878_c7_35bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1878_c7_35bd]
signal result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1878_c7_35bd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1880_c21_da8b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_3ba7]
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_38dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1883_c7_38dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826
BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left,
BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right,
BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output);

-- t8_MUX_uxn_opcodes_h_l1847_c2_34f9
t8_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- n16_MUX_uxn_opcodes_h_l1847_c2_34f9
n16_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9
result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9
result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9
result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9
result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9
result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

-- printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4
printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4 : entity work.printf_uxn_opcodes_h_l1848_c3_c3e4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left,
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right,
BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output);

-- t8_MUX_uxn_opcodes_h_l1852_c7_08f1
t8_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- n16_MUX_uxn_opcodes_h_l1852_c7_08f1
n16_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1
result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1
result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1
result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1
result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1
result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right,
BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output);

-- t8_MUX_uxn_opcodes_h_l1855_c7_0d40
t8_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- n16_MUX_uxn_opcodes_h_l1855_c7_0d40
n16_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40
result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40
result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40
result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40
result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output);

-- n16_MUX_uxn_opcodes_h_l1859_c7_06ff
n16_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output);

-- n16_MUX_uxn_opcodes_h_l1862_c7_d293
n16_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293
result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3
CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x,
CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right,
BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output);

-- n16_MUX_uxn_opcodes_h_l1867_c7_dd71
n16_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71
result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71
result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output);

-- n16_MUX_uxn_opcodes_h_l1870_c7_f349
n16_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349
result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349
result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2
BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left,
BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right,
BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d
BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left,
BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right,
BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665
BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left,
BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right,
BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output);

-- MUX_uxn_opcodes_h_l1873_c32_47ee
MUX_uxn_opcodes_h_l1873_c32_47ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1873_c32_47ee_cond,
MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue,
MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse,
MUX_uxn_opcodes_h_l1873_c32_47ee_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7
CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x,
CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd
result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd
result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond,
result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd
result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right,
BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output,
 t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output,
 t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output,
 t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output,
 n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output,
 n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output,
 CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output,
 n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output,
 n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output,
 MUX_uxn_opcodes_h_l1873_c32_47ee_return_output,
 CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1849_c3_e912 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_6613 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_9a9d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_48c4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_a816 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_5268 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_c7_dd71_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1875_c3_17a3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1876_c22_3056_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_68b6 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1881_c22_b813_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1863_DUPLICATE_83cf_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_31e2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1888_l1842_DUPLICATE_3fa8_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_6613 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1853_c3_6613;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_5268 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1868_c3_5268;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1849_c3_e912 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1849_c3_e912;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_a816 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1865_c3_a816;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_9a9d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1857_c3_9a9d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right := to_unsigned(8, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_48c4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_48c4;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right := to_unsigned(4, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1847_c6_7826] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_left;
     BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output := BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1883_c11_3ba7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output := result.sp_relative_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1881_c22_b813] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1881_c22_b813_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_11e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1867_c11_3fc8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_6251] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1863_DUPLICATE_83cf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1863_DUPLICATE_83cf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_31e2 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_31e2_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_ba3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_9d3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1855_c11_2020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_left;
     BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output := BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1873_c32_722d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_left;
     BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output := BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1852_c11_2b25] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_left;
     BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output := BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output := result.ram_addr;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_c7_dd71_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1873_c32_722d_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1847_c6_7826_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1852_c11_2b25_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1855_c11_2020_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_6251_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_ba3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1867_c11_3fc8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_9d3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_11e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1883_c11_3ba7_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_31e2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1863_DUPLICATE_83cf_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1871_l1863_DUPLICATE_83cf_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1881_c22_b813_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1855_l1852_l1847_l1870_l1867_l1862_l1859_DUPLICATE_db16_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_5701_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1870_l1867_l1862_l1859_DUPLICATE_eddb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1855_l1883_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_42eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_1407_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1855_l1852_l1878_l1847_l1867_l1862_l1859_DUPLICATE_4515_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1867_c7_dd71_return_output;
     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1847_c1_fe0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1878_c7_35bd] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output := result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1864_c3_b0f3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output := CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1878_c7_35bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1883_c7_38dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1883_c7_38dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1871_c3_c8b2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_left;
     BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output := BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1873_c32_2665] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_left;
     BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output := BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1873_c32_2665_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1871_c3_c8b2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1875_c3_17a3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1875_l1880_DUPLICATE_905b_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1864_c3_b0f3_return_output;
     VAR_printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1847_c1_fe0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1883_c7_38dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1875_c3_17a3;
     -- n16_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_35bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1878_c7_35bd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- printf_uxn_opcodes_h_l1848_c3_c3e4[uxn_opcodes_h_l1848_c3_c3e4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1848_c3_c3e4_uxn_opcodes_h_l1848_c3_c3e4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l1876_c32_87f7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output := CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1880_c21_da8b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output;

     -- MUX[uxn_opcodes_h_l1873_c32_47ee] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1873_c32_47ee_cond <= VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_cond;
     MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue <= VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iftrue;
     MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse <= VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_return_output := MUX_uxn_opcodes_h_l1873_c32_47ee_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_68b6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_da8b_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := VAR_MUX_uxn_opcodes_h_l1873_c32_47ee_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_68b6;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- t8_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1876_c22_3056] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1876_c22_3056_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1876_c32_87f7_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- n16_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1878_c7_35bd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1876_c22_3056_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1878_c7_35bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1870_c7_f349] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output := result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- n16_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1870_c7_f349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- n16_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1867_c7_dd71] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1867_c7_dd71_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1862_c7_d293] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1862_c7_d293_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1859_c7_06ff] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output := result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1859_c7_06ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1855_c7_0d40] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output := result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1855_c7_0d40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1852_c7_08f1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;

     -- Submodule level 10
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1852_c7_08f1_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1847_c2_34f9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1888_l1842_DUPLICATE_3fa8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1888_l1842_DUPLICATE_3fa8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1847_c2_34f9_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1888_l1842_DUPLICATE_3fa8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9cb5_uxn_opcodes_h_l1888_l1842_DUPLICATE_3fa8_return_output;
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
