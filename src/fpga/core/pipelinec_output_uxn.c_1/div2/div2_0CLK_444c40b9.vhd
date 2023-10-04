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
-- Submodules: 125
entity div2_0CLK_444c40b9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end div2_0CLK_444c40b9;
architecture arch of div2_0CLK_444c40b9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1809_c6_3937]
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1809_c1_15d6]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1809_c2_d3ca]
signal n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1810_c3_e278[uxn_opcodes_h_l1810_c3_e278]
signal printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1815_c11_896f]
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1815_c7_5557]
signal tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1815_c7_5557]
signal t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1815_c7_5557]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1815_c7_5557]
signal n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_1528]
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1818_c7_d059]
signal tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1818_c7_d059]
signal t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1818_c7_d059]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1818_c7_d059]
signal n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1823_c11_1f19]
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1823_c7_2570]
signal tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1823_c7_2570]
signal t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1823_c7_2570]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1823_c7_2570]
signal n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_b3ed]
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1826_c7_7552]
signal tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1826_c7_7552]
signal t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1826_c7_7552]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1826_c7_7552]
signal n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1827_c3_1e08]
signal BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_e4f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1830_c7_34f4]
signal n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_ac10]
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1833_c7_2e4f]
signal n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_04c9]
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1838_c7_10d7]
signal n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_fc4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1841_c7_d902]
signal tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1841_c7_d902]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1841_c7_d902]
signal n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1842_c3_cf2c]
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_4e5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l1843_c26_9061]
signal BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l1843_c11_425c]
signal MUX_uxn_opcodes_h_l1843_c11_425c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1843_c11_425c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1843_c11_425c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l1843_c11_425c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1846_c32_d414]
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1846_c32_7ddf]
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1846_c32_a3f8]
signal MUX_uxn_opcodes_h_l1846_c32_a3f8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_5c5d]
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_f63e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_f63e]
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_f63e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_f63e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_f63e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_ac54]
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_64d5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_64d5]
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_64d5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_64d5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1856_c34_f1fc]
signal CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_edf7]
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_397d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_397d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left,
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right,
BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca
tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- t16_MUX_uxn_opcodes_h_l1809_c2_d3ca
t16_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- n16_MUX_uxn_opcodes_h_l1809_c2_d3ca
n16_MUX_uxn_opcodes_h_l1809_c2_d3ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond,
n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue,
n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse,
n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

-- printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278
printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278 : entity work.printf_uxn_opcodes_h_l1810_c3_e278_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left,
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right,
BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1815_c7_5557
tmp16_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- t16_MUX_uxn_opcodes_h_l1815_c7_5557
t16_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- n16_MUX_uxn_opcodes_h_l1815_c7_5557
n16_MUX_uxn_opcodes_h_l1815_c7_5557 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond,
n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue,
n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse,
n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right,
BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1818_c7_d059
tmp16_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- t16_MUX_uxn_opcodes_h_l1818_c7_d059
t16_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- n16_MUX_uxn_opcodes_h_l1818_c7_d059
n16_MUX_uxn_opcodes_h_l1818_c7_d059 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond,
n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue,
n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse,
n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left,
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right,
BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1823_c7_2570
tmp16_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- t16_MUX_uxn_opcodes_h_l1823_c7_2570
t16_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570
result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570
result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570
result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- n16_MUX_uxn_opcodes_h_l1823_c7_2570
n16_MUX_uxn_opcodes_h_l1823_c7_2570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond,
n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue,
n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse,
n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1826_c7_7552
tmp16_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- t16_MUX_uxn_opcodes_h_l1826_c7_7552
t16_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- n16_MUX_uxn_opcodes_h_l1826_c7_7552
n16_MUX_uxn_opcodes_h_l1826_c7_7552 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond,
n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue,
n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse,
n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08
BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left,
BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right,
BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4
tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- n16_MUX_uxn_opcodes_h_l1830_c7_34f4
n16_MUX_uxn_opcodes_h_l1830_c7_34f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond,
n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue,
n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse,
n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right,
BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f
tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- n16_MUX_uxn_opcodes_h_l1833_c7_2e4f
n16_MUX_uxn_opcodes_h_l1833_c7_2e4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond,
n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue,
n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse,
n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right,
BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7
tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7
result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7
result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7
result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1838_c7_10d7
n16_MUX_uxn_opcodes_h_l1838_c7_10d7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond,
n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue,
n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse,
n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1841_c7_d902
tmp16_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902
result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902
result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- n16_MUX_uxn_opcodes_h_l1841_c7_d902
n16_MUX_uxn_opcodes_h_l1841_c7_d902 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond,
n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue,
n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse,
n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c
BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left,
BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right,
BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061
BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061 : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left,
BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right,
BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output);

-- MUX_uxn_opcodes_h_l1843_c11_425c
MUX_uxn_opcodes_h_l1843_c11_425c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1843_c11_425c_cond,
MUX_uxn_opcodes_h_l1843_c11_425c_iftrue,
MUX_uxn_opcodes_h_l1843_c11_425c_iffalse,
MUX_uxn_opcodes_h_l1843_c11_425c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414
BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left,
BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right,
BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf
BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left,
BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right,
BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output);

-- MUX_uxn_opcodes_h_l1846_c32_a3f8
MUX_uxn_opcodes_h_l1846_c32_a3f8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1846_c32_a3f8_cond,
MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue,
MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse,
MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right,
BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right,
BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc
CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x,
CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right,
BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8
CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output,
 tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output,
 tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output,
 tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output,
 tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output,
 tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output,
 MUX_uxn_opcodes_h_l1843_c11_425c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output,
 MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output,
 CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1812_c3_7154 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_f805 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a938 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_456c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_14cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_5ce2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_44cc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_1897 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1843_c11_425c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1843_c11_425c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_064f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1852_c24_25e8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_605d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1856_c24_ef3c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1854_l1841_DUPLICATE_fb4a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1805_l1863_DUPLICATE_00e9_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_f805 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1816_c3_f805;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_1897 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1839_c3_1897;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_44cc := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1836_c3_44cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right := to_unsigned(9, 4);
     VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_456c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1824_c3_456c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right := to_unsigned(10, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a938 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1821_c3_a938;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1812_c3_7154 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1812_c3_7154;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_14cc := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1828_c3_14cc;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_605d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1855_c3_605d;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_5ce2 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1831_c3_5ce2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_064f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1851_c3_064f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1818_c11_1528] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_left;
     BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output := BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1856_c34_f1fc] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output := CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1854_l1841_DUPLICATE_fb4a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1854_l1841_DUPLICATE_fb4a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1841_c11_fc4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1843_c11_4e5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1848_c11_5c5d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1838_c11_04c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l1846_c32_d414] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_left;
     BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output := BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1852_c24_25e8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1852_c24_25e8_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1833_c11_ac10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_left;
     BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output := BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1830_c11_e4f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_b3ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1815_c11_896f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1809_c6_3937] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_left;
     BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output := BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1823_c11_1f19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_left;
     BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output := BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1854_c11_ac54] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_left;
     BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output := BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1858_c11_edf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1846_c32_d414_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c6_3937_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1815_c11_896f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1818_c11_1528_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1823_c11_1f19_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_b3ed_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1830_c11_e4f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1833_c11_ac10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1838_c11_04c9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1841_c11_fc4c_return_output;
     VAR_MUX_uxn_opcodes_h_l1843_c11_425c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1843_c11_4e5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1848_c11_5c5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1854_c11_ac54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1858_c11_edf7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1834_l1819_l1827_l1842_DUPLICATE_b69b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1852_c24_25e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_9da5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1858_l1826_l1854_l1823_l1848_l1818_l1841_DUPLICATE_6685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1823_l1848_l1818_DUPLICATE_b8b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1815_l1838_l1833_l1830_l1826_l1823_l1818_l1841_DUPLICATE_89de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1858_l1826_l1854_l1823_l1818_l1841_DUPLICATE_8416_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1854_l1841_DUPLICATE_fb4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1854_l1841_DUPLICATE_fb4a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1815_l1838_l1809_l1833_l1830_l1826_l1854_l1823_l1818_l1841_DUPLICATE_43ae_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1848_c7_f63e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1858_c7_397d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1842_c3_cf2c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_left;
     BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output := BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1858_c7_397d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1856_c24_ef3c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1856_c24_ef3c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1856_c34_f1fc_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1809_c1_15d6] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1827_c3_1e08] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_left;
     BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output := BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1846_c32_7ddf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_left;
     BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output := BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1854_c7_64d5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1846_c32_7ddf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1827_c3_1e08_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1842_c3_cf2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1856_c24_ef3c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1820_l1835_DUPLICATE_a8a8_return_output;
     VAR_printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1809_c1_15d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1858_c7_397d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1858_c7_397d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;
     -- MUX[uxn_opcodes_h_l1846_c32_a3f8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1846_c32_a3f8_cond <= VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_cond;
     MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue <= VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iftrue;
     MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse <= VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output := MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1854_c7_64d5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1854_c7_64d5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1848_c7_f63e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l1843_c26_9061] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_left;
     BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output := BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- printf_uxn_opcodes_h_l1810_c3_e278[uxn_opcodes_h_l1810_c3_e278] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1810_c3_e278_uxn_opcodes_h_l1810_c3_e278_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1854_c7_64d5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l1843_c26_9061_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_MUX_uxn_opcodes_h_l1846_c32_a3f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1854_c7_64d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1848_c7_f63e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;

     -- MUX[uxn_opcodes_h_l1843_c11_425c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1843_c11_425c_cond <= VAR_MUX_uxn_opcodes_h_l1843_c11_425c_cond;
     MUX_uxn_opcodes_h_l1843_c11_425c_iftrue <= VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iftrue;
     MUX_uxn_opcodes_h_l1843_c11_425c_iffalse <= VAR_MUX_uxn_opcodes_h_l1843_c11_425c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1843_c11_425c_return_output := MUX_uxn_opcodes_h_l1843_c11_425c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1848_c7_f63e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1848_c7_f63e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue := VAR_MUX_uxn_opcodes_h_l1843_c11_425c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1848_c7_f63e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     -- t16_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1841_c7_d902] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_cond;
     tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output := tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1841_c7_d902_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- t16_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1838_c7_10d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1838_c7_10d7_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- t16_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- n16_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1833_c7_2e4f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1833_c7_2e4f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- n16_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1830_c7_34f4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1830_c7_34f4_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1826_c7_7552] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output := result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- n16_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1826_c7_7552_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- n16_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1823_c7_2570] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output := result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1823_c7_2570_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- n16_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1818_c7_d059] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1818_c7_d059_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1815_c7_5557] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1815_c7_5557_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1809_c2_d3ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1805_l1863_DUPLICATE_00e9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1805_l1863_DUPLICATE_00e9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c2_d3ca_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1805_l1863_DUPLICATE_00e9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1805_l1863_DUPLICATE_00e9_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
