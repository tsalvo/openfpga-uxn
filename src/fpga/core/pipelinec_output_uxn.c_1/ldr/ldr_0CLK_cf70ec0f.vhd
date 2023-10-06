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
-- Submodules: 71
entity ldr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_cf70ec0f;
architecture arch of ldr_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1848_c6_4756]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c1_c648]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1848_c2_aff9]
signal tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1849_c3_a745[uxn_opcodes_h_l1849_c3_a745]
signal printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_d797]
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1854_c7_e17a]
signal tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_a0a5]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1857_c7_4b5a]
signal tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1861_c32_964b]
signal BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1861_c32_3eaf]
signal BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1861_c32_3bb8]
signal MUX_uxn_opcodes_h_l1861_c32_3bb8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_ac5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1863_c7_bae9]
signal tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_a054]
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1868_c7_dbc7]
signal tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_4730]
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1871_c7_4645]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1871_c7_4645]
signal result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_4645]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_4645]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_4645]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1871_c7_4645]
signal tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_377b]
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_ef3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_ef3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756
BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output);

-- t8_MUX_uxn_opcodes_h_l1848_c2_aff9
t8_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9
result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9
result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9
result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9
tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond,
tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

-- printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745
printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745 : entity work.printf_uxn_opcodes_h_l1849_c3_a745_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output);

-- t8_MUX_uxn_opcodes_h_l1854_c7_e17a
t8_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a
result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a
result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a
tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond,
tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output);

-- t8_MUX_uxn_opcodes_h_l1857_c7_4b5a
t8_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a
result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a
tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond,
tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b
BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left,
BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right,
BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf
BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left,
BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right,
BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output);

-- MUX_uxn_opcodes_h_l1861_c32_3bb8
MUX_uxn_opcodes_h_l1861_c32_3bb8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1861_c32_3bb8_cond,
MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue,
MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse,
MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9
result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9
tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond,
tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right,
BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7
tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond,
tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue,
tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse,
tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right,
BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645
result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645
result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1871_c7_4645
tmp8_MUX_uxn_opcodes_h_l1871_c7_4645 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond,
tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue,
tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse,
tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right,
BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output,
 t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output,
 t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output,
 t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output,
 MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_9685 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_b008 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1866_c3_9bd3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1869_c3_bfc7 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_6aee : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1857_l1854_DUPLICATE_3f8d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1869_l1866_DUPLICATE_1ade_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1844_l1883_DUPLICATE_62d8_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_b008 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_b008;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_9685 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_9685;
     VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_6aee := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1875_c3_6aee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left := VAR_ins;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1857_l1854_DUPLICATE_3f8d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1857_l1854_DUPLICATE_3f8d_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1871_c11_4730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_left;
     BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output := BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1868_c11_a054] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_left;
     BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output := BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c6_4756] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1863_c11_ac5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output := result.is_stack_write;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1869_l1866_DUPLICATE_1ade LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1869_l1866_DUPLICATE_1ade_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1878_c11_377b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_d797] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_left;
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output := BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_a0a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1861_c32_964b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_left;
     BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output := BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1861_c32_964b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c6_4756_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_d797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_a0a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1863_c11_ac5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1868_c11_a054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1871_c11_4730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1878_c11_377b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1869_l1866_DUPLICATE_1ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1857_l1848_l1854_DUPLICATE_da25_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1857_l1848_l1854_l1868_DUPLICATE_f217_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1878_DUPLICATE_6a34_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1871_l1868_l1857_l1854_l1848_DUPLICATE_bd31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1848_l1863_l1854_DUPLICATE_f4b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1857_l1854_DUPLICATE_3f8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1857_l1854_DUPLICATE_3f8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1868_l1863_l1857_l1854_l1848_l1878_DUPLICATE_7158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1857_l1871_l1863_l1868_DUPLICATE_1c2f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1871_l1868_l1863_l1857_l1854_l1848_DUPLICATE_5e14_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1878_c7_ef3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1848_c1_c648] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1861_c32_3eaf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_left;
     BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output := BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- t8_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1878_c7_ef3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1861_c32_3eaf_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1866_c3_9bd3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1869_c3_bfc7 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1866_l1869_DUPLICATE_fba1_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1848_c1_c648_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1878_c7_ef3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1866_c3_9bd3;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1869_c3_bfc7;
     -- result_stack_value_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- MUX[uxn_opcodes_h_l1861_c32_3bb8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1861_c32_3bb8_cond <= VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_cond;
     MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue <= VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iftrue;
     MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse <= VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output := MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- printf_uxn_opcodes_h_l1849_c3_a745[uxn_opcodes_h_l1849_c3_a745] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1849_c3_a745_uxn_opcodes_h_l1849_c3_a745_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1871_c7_4645] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;

     -- t8_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue := VAR_MUX_uxn_opcodes_h_l1861_c32_3bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1871_c7_4645_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1868_c7_dbc7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1868_c7_dbc7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1863_c7_bae9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1863_c7_bae9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_4b5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_4b5a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_e17a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_e17a_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c2_aff9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1844_l1883_DUPLICATE_62d8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1844_l1883_DUPLICATE_62d8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1848_c2_aff9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1844_l1883_DUPLICATE_62d8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d3d2_uxn_opcodes_h_l1844_l1883_DUPLICATE_62d8_return_output;
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
