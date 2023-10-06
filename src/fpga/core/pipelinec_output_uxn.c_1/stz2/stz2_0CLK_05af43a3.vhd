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
entity stz2_0CLK_05af43a3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_05af43a3;
architecture arch of stz2_0CLK_05af43a3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1796_c6_9e6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1796_c1_b9a7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1796_c2_5048]
signal t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1796_c2_5048]
signal n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1796_c2_5048]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1797_c3_2706[uxn_opcodes_h_l1797_c3_2706]
signal printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_fb09]
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1802_c7_f7f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_1d12]
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1805_c7_c48c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1809_c11_3f6c]
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1809_c7_fbd8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_fbb9]
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c7_dc5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1814_c3_f7f0]
signal CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_7f51]
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c7_bad6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_379a]
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1820_c7_c27b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1821_c3_63ed]
signal BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1824_c32_ee54]
signal BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1824_c32_9a6d]
signal BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1824_c32_0ef8]
signal MUX_uxn_opcodes_h_l1824_c32_0ef8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_56b9]
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_a4d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1826_c7_a4d8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(15 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1826_c7_a4d8]
signal result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_a4d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1826_c7_a4d8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1830_c32_c495]
signal CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_1f47]
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1832_c7_c59d]
signal result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_c59d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_c59d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1832_c7_c59d]
signal result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1833_c32_fb77]
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_b654]
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_9f70]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_9f70]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c
BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output);

-- t8_MUX_uxn_opcodes_h_l1796_c2_5048
t8_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- n16_MUX_uxn_opcodes_h_l1796_c2_5048
n16_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048
result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048
result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048
result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048
result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048
result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

-- printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706
printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706 : entity work.printf_uxn_opcodes_h_l1797_c3_2706_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right,
BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output);

-- t8_MUX_uxn_opcodes_h_l1802_c7_f7f6
t8_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- n16_MUX_uxn_opcodes_h_l1802_c7_f7f6
n16_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6
result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right,
BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output);

-- t8_MUX_uxn_opcodes_h_l1805_c7_c48c
t8_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- n16_MUX_uxn_opcodes_h_l1805_c7_c48c
n16_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c
result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c
result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c
result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c
result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c
result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c
BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left,
BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right,
BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output);

-- n16_MUX_uxn_opcodes_h_l1809_c7_fbd8
n16_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right,
BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output);

-- n16_MUX_uxn_opcodes_h_l1812_c7_dc5f
n16_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0
CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x,
CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right,
BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output);

-- n16_MUX_uxn_opcodes_h_l1817_c7_bad6
n16_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right,
BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output);

-- n16_MUX_uxn_opcodes_h_l1820_c7_c27b
n16_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b
result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b
result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b
result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed
BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left,
BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right,
BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54
BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left,
BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right,
BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d
BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left,
BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right,
BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output);

-- MUX_uxn_opcodes_h_l1824_c32_0ef8
MUX_uxn_opcodes_h_l1824_c32_0ef8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1824_c32_0ef8_cond,
MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue,
MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse,
MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right,
BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8
result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8
result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond,
result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8
result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1830_c32_c495
CONST_SR_8_uxn_opcodes_h_l1830_c32_c495 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x,
CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right,
BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d
result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d
result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond,
result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77
BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right,
BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right,
BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output,
 t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output,
 t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output,
 t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output,
 n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output,
 n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output,
 n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output,
 n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output,
 MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output,
 CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1799_c3_9844 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1803_c3_9048 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1807_c3_85c4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_1d38 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_8eff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_1e92 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1817_c7_bad6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1829_c21_d1e6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1830_c22_7007_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1833_c21_35d5_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1834_c22_29ab_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1821_l1813_DUPLICATE_03a6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1841_l1790_DUPLICATE_5cb2_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1807_c3_85c4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1807_c3_85c4;
     VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_1d38 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1810_c3_1d38;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1799_c3_9844 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1799_c3_9844;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right := to_unsigned(8, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_1e92 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1818_c3_1e92;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_8eff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1815_c3_8eff;
     VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1803_c3_9048 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1803_c3_9048;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1802_c11_fb09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_left;
     BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output := BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1829_c21_d1e6] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1829_c21_d1e6_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1834_c22_29ab] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1834_c22_29ab_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1836_c11_b654] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_left;
     BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output := BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1805_c11_1d12] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_left;
     BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output := BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1832_c11_1f47] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_left;
     BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output := BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1820_c11_379a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1824_c32_ee54] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_left;
     BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output := BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1809_c11_3f6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1826_c11_56b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output := result.is_sp_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1833_c32_fb77] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output := result.is_ram_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1812_c11_fbb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output := result.is_opc_done;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1821_l1813_DUPLICATE_03a6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1821_l1813_DUPLICATE_03a6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1817_c11_7f51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_left;
     BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output := BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1817_c7_bad6_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1796_c6_9e6c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1830_c32_c495] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output := CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output := result.ram_addr;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1824_c32_ee54_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1796_c6_9e6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1802_c11_fb09_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1805_c11_1d12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1809_c11_3f6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1812_c11_fbb9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1817_c11_7f51_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1820_c11_379a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1826_c11_56b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1832_c11_1f47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1836_c11_b654_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1829_c21_d1e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1821_l1813_DUPLICATE_03a6_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1821_l1813_DUPLICATE_03a6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1834_c22_29ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1796_l1820_DUPLICATE_8a05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_7a5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1826_l1820_DUPLICATE_fe43_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1836_l1805_l1832_l1802_l1796_l1820_DUPLICATE_a74d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1826_l1796_DUPLICATE_45bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1802_l1820_DUPLICATE_76b5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1817_l1812_l1809_l1805_l1832_l1802_l1796_l1820_DUPLICATE_4335_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1817_c7_bad6_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1824_c32_9a6d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_left;
     BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output := BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1814_c3_f7f0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output := CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1826_c7_a4d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1836_c7_9f70] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1796_c1_b9a7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1836_c7_9f70] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output;

     -- t8_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1832_c7_c59d] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output := result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1833_c21_35d5] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1833_c21_35d5_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1833_c32_fb77_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1830_c22_7007] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1830_c22_7007_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1830_c32_c495_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l1821_c3_63ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_left;
     BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output := BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1824_c32_9a6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1821_c3_63ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1833_c21_35d5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1830_c22_7007_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1814_c3_f7f0_return_output;
     VAR_printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1796_c1_b9a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1836_c7_9f70_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1832_c7_c59d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1826_c7_a4d8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output := result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- MUX[uxn_opcodes_h_l1824_c32_0ef8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1824_c32_0ef8_cond <= VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_cond;
     MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue <= VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iftrue;
     MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse <= VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output := MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1832_c7_c59d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1832_c7_c59d] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;

     -- printf_uxn_opcodes_h_l1797_c3_2706[uxn_opcodes_h_l1797_c3_2706] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1797_c3_2706_uxn_opcodes_h_l1797_c3_2706_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue := VAR_MUX_uxn_opcodes_h_l1824_c32_0ef8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1832_c7_c59d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1826_c7_a4d8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1826_c7_a4d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1826_c7_a4d8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1826_c7_a4d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1820_c7_c27b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1820_c7_c27b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1817_c7_bad6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1817_c7_bad6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1812_c7_dc5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1812_c7_dc5f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1809_c7_fbd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1809_c7_fbd8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- n16_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1805_c7_c48c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1805_c7_c48c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1802_c7_f7f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1802_c7_f7f6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1796_c2_5048] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1841_l1790_DUPLICATE_5cb2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1841_l1790_DUPLICATE_5cb2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6c87(
     result,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1796_c2_5048_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1796_c2_5048_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1841_l1790_DUPLICATE_5cb2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6c87_uxn_opcodes_h_l1841_l1790_DUPLICATE_5cb2_return_output;
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
