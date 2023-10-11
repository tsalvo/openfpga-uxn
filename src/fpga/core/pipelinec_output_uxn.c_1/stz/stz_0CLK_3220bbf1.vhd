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
-- Submodules: 58
entity stz_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_3220bbf1;
architecture arch of stz_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1642_c6_7e28]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1642_c1_0b0b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1642_c2_fa21]
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1643_c3_b4b2[uxn_opcodes_h_l1643_c3_b4b2]
signal printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_f8bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1647_c7_bf6e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_c4c6]
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1650_c7_85df]
signal n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1650_c7_85df]
signal t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_85df]
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_0942]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1654_c7_099a]
signal n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1654_c7_099a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_bbf9]
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1657_c7_4ea0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1660_c32_c33b]
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1660_c32_b9e3]
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1660_c32_dd56]
signal MUX_uxn_opcodes_h_l1660_c32_dd56_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1660_c32_dd56_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1665_c11_758a]
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1665_c7_5d09]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1665_c7_5d09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1665_c7_5d09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output);

-- n8_MUX_uxn_opcodes_h_l1642_c2_fa21
n8_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c2_fa21
t8_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

-- printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2
printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2 : entity work.printf_uxn_opcodes_h_l1643_c3_b4b2_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output);

-- n8_MUX_uxn_opcodes_h_l1647_c7_bf6e
n8_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- t8_MUX_uxn_opcodes_h_l1647_c7_bf6e
t8_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right,
BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output);

-- n8_MUX_uxn_opcodes_h_l1650_c7_85df
n8_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- t8_MUX_uxn_opcodes_h_l1650_c7_85df
t8_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output);

-- n8_MUX_uxn_opcodes_h_l1654_c7_099a
n8_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right,
BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output);

-- n8_MUX_uxn_opcodes_h_l1657_c7_4ea0
n8_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b
BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left,
BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right,
BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3
BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left,
BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right,
BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output);

-- MUX_uxn_opcodes_h_l1660_c32_dd56
MUX_uxn_opcodes_h_l1660_c32_dd56 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1660_c32_dd56_cond,
MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue,
MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse,
MUX_uxn_opcodes_h_l1660_c32_dd56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left,
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right,
BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output,
 n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output,
 n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output,
 n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output,
 n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output,
 n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output,
 MUX_uxn_opcodes_h_l1660_c32_dd56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_1379 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_6d0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_7c5a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_ee7d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_099a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_178f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1671_l1638_DUPLICATE_956a_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_6d0a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_6d0a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right := to_unsigned(128, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_ee7d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1655_c3_ee7d;
     VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_1379 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1644_c3_1379;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_7c5a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_7c5a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := VAR_previous_stack_read;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := t8;
     -- BIN_OP_AND[uxn_opcodes_h_l1660_c32_c33b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_left;
     BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output := BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1657_c11_bbf9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1662_c21_178f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_178f_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1665_c11_758a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output := result.ram_addr;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_099a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1647_c11_f8bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c6_7e28] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_0942] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1650_c11_c4c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1660_c32_c33b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c6_7e28_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1647_c11_f8bc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1650_c11_c4c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_0942_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1657_c11_bbf9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1665_c11_758a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1662_c21_178f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_0de9_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_a29d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1650_l1647_l1665_l1657_l1654_DUPLICATE_0926_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_f56e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1665_l1654_DUPLICATE_20d5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1650_l1647_l1642_l1657_l1654_DUPLICATE_cac3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1654_c7_099a_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1665_c7_5d09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1642_c1_0b0b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output;

     -- n8_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1665_c7_5d09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1660_c32_b9e3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_left;
     BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output := BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- t8_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1665_c7_5d09] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1660_c32_b9e3_return_output;
     VAR_printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1642_c1_0b0b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1665_c7_5d09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- MUX[uxn_opcodes_h_l1660_c32_dd56] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1660_c32_dd56_cond <= VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_cond;
     MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue <= VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iftrue;
     MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse <= VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_return_output := MUX_uxn_opcodes_h_l1660_c32_dd56_return_output;

     -- n8_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- printf_uxn_opcodes_h_l1643_c3_b4b2[uxn_opcodes_h_l1643_c3_b4b2] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1643_c3_b4b2_uxn_opcodes_h_l1643_c3_b4b2_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue := VAR_MUX_uxn_opcodes_h_l1660_c32_dd56_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- t8_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- n8_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1657_c7_4ea0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1657_c7_4ea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_099a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_099a_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1650_c7_85df] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1650_c7_85df_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1647_c7_bf6e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- Submodule level 7
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1647_c7_bf6e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c2_fa21] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1671_l1638_DUPLICATE_956a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1671_l1638_DUPLICATE_956a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_6a81(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1642_c2_fa21_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1671_l1638_DUPLICATE_956a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_6a81_uxn_opcodes_h_l1671_l1638_DUPLICATE_956a_return_output;
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
