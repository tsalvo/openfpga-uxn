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
-- Submodules: 65
entity ldr_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_67fe881f;
architecture arch of ldr_0CLK_67fe881f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_c874]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_025d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1812_c2_5eff]
signal tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1813_c3_3ff7[uxn_opcodes_h_l1813_c3_3ff7]
signal printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_e8e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1818_c7_9c37]
signal tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_8332]
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1821_c7_32b2]
signal tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1825_c32_c256]
signal BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1825_c32_733c]
signal BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1825_c32_c3db]
signal MUX_uxn_opcodes_h_l1825_c32_c3db_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1825_c32_c3db_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1827_c21_abc4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_bafb]
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_5366]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1829_c7_5366]
signal tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1831_c21_3c2a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_e957]
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1833_c7_4027]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1833_c7_4027]
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_4027]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_4027]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_4027]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1833_c7_4027]
signal tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_1718]
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_ccf1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_ccf1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output);

-- t8_MUX_uxn_opcodes_h_l1812_c2_5eff
t8_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff
result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff
result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff
result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff
tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond,
tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue,
tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse,
tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

-- printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7
printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7 : entity work.printf_uxn_opcodes_h_l1813_c3_3ff7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output);

-- t8_MUX_uxn_opcodes_h_l1818_c7_9c37
t8_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37
result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37
tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond,
tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue,
tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse,
tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right,
BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output);

-- t8_MUX_uxn_opcodes_h_l1821_c7_32b2
t8_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2
result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2
result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2
result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2
result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2
tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond,
tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256
BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left,
BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right,
BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c
BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left,
BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right,
BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output);

-- MUX_uxn_opcodes_h_l1825_c32_c3db
MUX_uxn_opcodes_h_l1825_c32_c3db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1825_c32_c3db_cond,
MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue,
MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse,
MUX_uxn_opcodes_h_l1825_c32_c3db_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4
BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right,
BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366
result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366
result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1829_c7_5366
tmp8_MUX_uxn_opcodes_h_l1829_c7_5366 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond,
tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue,
tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse,
tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a
BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027
result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1833_c7_4027
tmp8_MUX_uxn_opcodes_h_l1833_c7_4027 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond,
tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue,
tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse,
tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right,
BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output,
 t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output,
 t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output,
 t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output,
 MUX_uxn_opcodes_h_l1825_c32_c3db_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_c26a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_4d72 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1827_c3_82e5 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1827_c26_5ad4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1831_c3_f38d : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1831_c26_1312_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_02a5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1818_l1821_DUPLICATE_107e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1845_l1808_DUPLICATE_5f07_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right := to_unsigned(4, 3);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_c26a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_c26a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_02a5 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1837_c3_02a5;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_4d72 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1819_c3_4d72;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := tmp8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1825_c32_c256] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_left;
     BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output := BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1840_c11_1718] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_left;
     BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output := BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c6_c874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1818_l1821_DUPLICATE_107e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1818_l1821_DUPLICATE_107e_return_output := result.is_stack_read;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1831_c26_1312] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1831_c26_1312_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_e957] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_left;
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output := BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1827_c26_5ad4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1827_c26_5ad4_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1829_c11_bafb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_e8e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1821_c11_8332] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_left;
     BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output := BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1825_c32_c256_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c6_c874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_e8e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1821_c11_8332_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1829_c11_bafb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_e957_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1840_c11_1718_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1827_c26_5ad4_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1831_c26_1312_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1818_l1821_l1812_DUPLICATE_2a02_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_8add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1840_l1833_DUPLICATE_be22_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1829_l1818_l1833_l1812_DUPLICATE_e5c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1829_l1818_l1812_DUPLICATE_e4a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1818_l1821_DUPLICATE_107e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1818_l1821_DUPLICATE_107e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1840_DUPLICATE_65a7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1829_l1833_l1821_DUPLICATE_1204_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1829_l1821_l1818_l1812_l1833_DUPLICATE_5a01_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1840_c7_ccf1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1827_c21_abc4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1831_c21_3c2a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1812_c1_025d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- t8_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1840_c7_ccf1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1825_c32_733c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_left;
     BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output := BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1825_c32_733c_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1827_c3_82e5 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1827_c21_abc4_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1831_c3_f38d := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1831_c21_3c2a_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1812_c1_025d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1840_c7_ccf1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1827_c3_82e5;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1831_c3_f38d;
     -- result_stack_value_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- t8_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- printf_uxn_opcodes_h_l1813_c3_3ff7[uxn_opcodes_h_l1813_c3_3ff7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1813_c3_3ff7_uxn_opcodes_h_l1813_c3_3ff7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_4027] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;

     -- MUX[uxn_opcodes_h_l1825_c32_c3db] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1825_c32_c3db_cond <= VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_cond;
     MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue <= VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iftrue;
     MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse <= VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_return_output := MUX_uxn_opcodes_h_l1825_c32_c3db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue := VAR_MUX_uxn_opcodes_h_l1825_c32_c3db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_4027_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- t8_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1829_c7_5366] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1829_c7_5366_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1821_c7_32b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1821_c7_32b2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_9c37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_9c37_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c2_5eff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1845_l1808_DUPLICATE_5f07 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1845_l1808_DUPLICATE_5f07_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c2_5eff_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1845_l1808_DUPLICATE_5f07_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1845_l1808_DUPLICATE_5f07_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
