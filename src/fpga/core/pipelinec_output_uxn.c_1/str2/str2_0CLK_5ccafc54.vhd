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
-- Submodules: 96
entity str2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_5ccafc54;
architecture arch of str2_0CLK_5ccafc54 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1945_c6_f35b]
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1945_c1_a0fc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1945_c2_4a2e]
signal n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1946_c3_53c1[uxn_opcodes_h_l1946_c3_53c1]
signal printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1951_c11_4a31]
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1951_c7_b3ac]
signal n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_f276]
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1954_c7_b6cc]
signal n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_8722]
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1958_c7_a27f]
signal n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_63d2]
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1961_c7_48ef]
signal n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1963_c3_9f3d]
signal CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_7eb6]
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1966_c7_3227]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1966_c7_3227]
signal n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1969_c11_c0af]
signal BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1969_c7_3198]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1969_c7_3198]
signal n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1970_c3_f11b]
signal BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1973_c32_11b8]
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1973_c32_2582]
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1973_c32_32f9]
signal MUX_uxn_opcodes_h_l1973_c32_32f9_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1973_c32_32f9_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1976_c32_27be]
signal CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_0199]
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1978_c7_31c0]
signal result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_31c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_31c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1978_c7_31c0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1978_c7_31c0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1980_c21_9ab9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_b912]
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_9481]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1983_c7_9481]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output : signed(17 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left,
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right,
BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output);

-- t8_MUX_uxn_opcodes_h_l1945_c2_4a2e
t8_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- n16_MUX_uxn_opcodes_h_l1945_c2_4a2e
n16_MUX_uxn_opcodes_h_l1945_c2_4a2e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond,
n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue,
n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse,
n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

-- printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1
printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1 : entity work.printf_uxn_opcodes_h_l1946_c3_53c1_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left,
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right,
BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output);

-- t8_MUX_uxn_opcodes_h_l1951_c7_b3ac
t8_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- n16_MUX_uxn_opcodes_h_l1951_c7_b3ac
n16_MUX_uxn_opcodes_h_l1951_c7_b3ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond,
n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue,
n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse,
n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right,
BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output);

-- t8_MUX_uxn_opcodes_h_l1954_c7_b6cc
t8_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- n16_MUX_uxn_opcodes_h_l1954_c7_b6cc
n16_MUX_uxn_opcodes_h_l1954_c7_b6cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond,
n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue,
n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse,
n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right,
BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- n16_MUX_uxn_opcodes_h_l1958_c7_a27f
n16_MUX_uxn_opcodes_h_l1958_c7_a27f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond,
n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue,
n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse,
n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right,
BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- n16_MUX_uxn_opcodes_h_l1961_c7_48ef
n16_MUX_uxn_opcodes_h_l1961_c7_48ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond,
n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue,
n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse,
n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d
CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x,
CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right,
BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227
result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227
result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227
result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227
result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- n16_MUX_uxn_opcodes_h_l1966_c7_3227
n16_MUX_uxn_opcodes_h_l1966_c7_3227 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond,
n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue,
n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse,
n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af
BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left,
BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right,
BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198
result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198
result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198
result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198
result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198
result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198
result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198
result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- n16_MUX_uxn_opcodes_h_l1969_c7_3198
n16_MUX_uxn_opcodes_h_l1969_c7_3198 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond,
n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue,
n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse,
n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b
BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left,
BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right,
BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8
BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right,
BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582
BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right,
BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output);

-- MUX_uxn_opcodes_h_l1973_c32_32f9
MUX_uxn_opcodes_h_l1973_c32_32f9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1973_c32_32f9_cond,
MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue,
MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse,
MUX_uxn_opcodes_h_l1973_c32_32f9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1976_c32_27be
CONST_SR_8_uxn_opcodes_h_l1976_c32_27be : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x,
CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0
result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0
result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0
result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9
BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481
result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output,
 t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output,
 t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output,
 t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output,
 CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output,
 MUX_uxn_opcodes_h_l1973_c32_32f9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_e098 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_fcbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_0dda : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_1859 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_ea41 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1967_c3_0aca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_c7_3227_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1975_c3_c494 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1976_c22_31d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1980_c3_f10c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1981_c22_318f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1962_l1970_DUPLICATE_6f9d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_84e6_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1988_l1940_DUPLICATE_3a1c_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_fcbd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1952_c3_fcbd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1967_c3_0aca := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1967_c3_0aca;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_ea41 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1964_c3_ea41;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right := to_unsigned(128, 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right := to_unsigned(7, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_0dda := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1956_c3_0dda;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_1859 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1959_c3_1859;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse := resize(to_signed(-3, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_e098 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1948_c3_e098;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := t8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1969_c11_c0af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1962_l1970_DUPLICATE_6f9d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1962_l1970_DUPLICATE_6f9d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1961_c11_63d2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1945_c6_f35b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_b912] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_left;
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output := BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1981_c22_318f] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1981_c22_318f_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1966_c11_7eb6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1954_c11_f276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_left;
     BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output := BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_84e6 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_84e6_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1958_c11_8722] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_left;
     BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output := BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1973_c32_11b8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_left;
     BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output := BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_0199] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_left;
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output := BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1951_c11_4a31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_left;
     BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output := BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_c7_3227_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1973_c32_11b8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1945_c6_f35b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1951_c11_4a31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1954_c11_f276_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1958_c11_8722_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1961_c11_63d2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1966_c11_7eb6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1969_c11_c0af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_0199_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_b912_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_84e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1962_l1970_DUPLICATE_6f9d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1962_l1970_DUPLICATE_6f9d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1981_c22_318f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1945_l1969_l1966_DUPLICATE_4929_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_afcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1969_l1966_DUPLICATE_633a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1983_l1951_l1978_l1945_l1966_DUPLICATE_8fdc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_7b36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1969_l1966_DUPLICATE_a9a7_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1961_l1958_l1954_l1951_l1978_l1945_l1966_DUPLICATE_f55f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1966_c7_3227_return_output;
     -- t8_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1983_c7_9481] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1963_c3_9f3d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output := CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_9481] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1978_c7_31c0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_31c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1970_c3_f11b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_left;
     BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output := BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1973_c32_2582] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_left;
     BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output := BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1945_c1_a0fc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1973_c32_2582_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1970_c3_f11b_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1975_c3_c494 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1975_l1980_DUPLICATE_a395_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1963_c3_9f3d_return_output;
     VAR_printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1945_c1_a0fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_9481_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1983_c7_9481_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1975_c3_c494;
     -- CONST_SR_8[uxn_opcodes_h_l1976_c32_27be] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output := CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- t8_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- MUX[uxn_opcodes_h_l1973_c32_32f9] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1973_c32_32f9_cond <= VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_cond;
     MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue <= VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iftrue;
     MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse <= VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_return_output := MUX_uxn_opcodes_h_l1973_c32_32f9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1980_c21_9ab9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1978_c7_31c0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;

     -- printf_uxn_opcodes_h_l1946_c3_53c1[uxn_opcodes_h_l1946_c3_53c1] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1946_c3_53c1_uxn_opcodes_h_l1946_c3_53c1_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_31c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1980_c3_f10c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1980_c21_9ab9_return_output)),16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := VAR_MUX_uxn_opcodes_h_l1973_c32_32f9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1980_c3_f10c;
     -- t8_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1978_c7_31c0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- n16_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1976_c22_31d3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1976_c22_31d3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1976_c32_27be_return_output);

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1976_c22_31d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1978_c7_31c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- n16_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1969_c7_3198] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1969_c7_3198_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1966_c7_3227] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output := result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- n16_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1966_c7_3227_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     -- n16_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1961_c7_48ef] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output := result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1961_c7_48ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1958_c7_a27f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1958_c7_a27f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- n16_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1954_c7_b6cc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output := result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1954_c7_b6cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1951_c7_b3ac] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;

     -- Submodule level 10
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1951_c7_b3ac_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1945_c2_4a2e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1988_l1940_DUPLICATE_3a1c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1988_l1940_DUPLICATE_3a1c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fd01(
     result,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1945_c2_4a2e_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1988_l1940_DUPLICATE_3a1c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fd01_uxn_opcodes_h_l1988_l1940_DUPLICATE_3a1c_return_output;
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
