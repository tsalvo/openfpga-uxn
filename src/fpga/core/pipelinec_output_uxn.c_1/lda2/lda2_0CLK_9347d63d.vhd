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
entity lda2_0CLK_9347d63d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_9347d63d;
architecture arch of lda2_0CLK_9347d63d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1414_c6_12b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1414_c1_b44f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1414_c2_816e]
signal tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1414_c2_816e]
signal t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c2_816e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1415_c3_abb3[uxn_opcodes_h_l1415_c3_abb3]
signal printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_cb14]
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_9b7f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_3381]
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_ee73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1425_c3_5df3]
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1428_c11_fd94]
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1428_c7_7ac8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_d7e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_4d5f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1432_c3_ab77]
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1435_c32_1ca4]
signal BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1435_c32_8025]
signal BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1435_c32_1375]
signal MUX_uxn_opcodes_h_l1435_c32_1375_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1435_c32_1375_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1435_c32_1375_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1435_c32_1375_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_85c3]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_9f92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_9257]
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_0e95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1445_c11_9c7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c7_7b11]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1447_c3_4e33]
signal CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1448_c21_bf9a]
signal BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_a6e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_bf90]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1451_c21_73ab]
signal BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1453_c11_3e79]
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1453_c7_198b]
signal tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1453_c7_198b]
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1453_c7_198b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1453_c7_198b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1453_c7_198b]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1453_c7_198b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1454_c3_6332]
signal BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_a8bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_d913]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_d913]
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_d913]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_d913]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1462_c34_8d8d]
signal CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_5fa5]
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_df57]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_df57]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_f637( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8
BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1414_c2_816e
tmp16_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- t16_MUX_uxn_opcodes_h_l1414_c2_816e
t16_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e
result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e
result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e
result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

-- printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3
printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3 : entity work.printf_uxn_opcodes_h_l1415_c3_abb3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right,
BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f
tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- t16_MUX_uxn_opcodes_h_l1420_c7_9b7f
t16_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right,
BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73
tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- t16_MUX_uxn_opcodes_h_l1423_c7_ee73
t16_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73
result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73
result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73
result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3
CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x,
CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left,
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right,
BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8
tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- t16_MUX_uxn_opcodes_h_l1428_c7_7ac8
t16_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f
tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- t16_MUX_uxn_opcodes_h_l1431_c7_4d5f
t16_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77
BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right,
BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4
BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left,
BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right,
BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025
BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left,
BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right,
BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output);

-- MUX_uxn_opcodes_h_l1435_c32_1375
MUX_uxn_opcodes_h_l1435_c32_1375 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1435_c32_1375_cond,
MUX_uxn_opcodes_h_l1435_c32_1375_iftrue,
MUX_uxn_opcodes_h_l1435_c32_1375_iffalse,
MUX_uxn_opcodes_h_l1435_c32_1375_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92
tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92
result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92
result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95
tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95
result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95
result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11
tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11
result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11
result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11
result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33
CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x,
CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a
BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left,
BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right,
BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90
tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90
result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90
result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab
BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left,
BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right,
BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left,
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right,
BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1453_c7_198b
tmp16_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b
result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332
BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left,
BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right,
BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d
CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x,
CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right,
BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output,
 tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output,
 tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output,
 tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output,
 CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output,
 tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output,
 MUX_uxn_opcodes_h_l1435_c32_1375_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output,
 tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output,
 tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output,
 CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output,
 tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output,
 tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output,
 CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1417_c3_53b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_125f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_bca1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1429_c3_9b71 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1435_c32_1375_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1435_c32_1375_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1448_c3_8155 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1451_c3_2e5b : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_e1f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1458_c24_0f40_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_ae00 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c24_5fcd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1424_DUPLICATE_0ff0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1446_l1454_DUPLICATE_cc1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1410_l1469_DUPLICATE_4f3b_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_125f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1421_c3_125f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right := to_unsigned(11, 4);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right := to_unsigned(6, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_bca1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1426_c3_bca1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_ae00 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1461_c3_ae00;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1429_c3_9b71 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1429_c3_9b71;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_e1f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1457_c3_e1f2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1417_c3_53b1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1417_c3_53b1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1448_c21_bf9a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1450_c11_a6e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1451_c21_73ab] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1435_c32_1ca4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_left;
     BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output := BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1462_c34_8d8d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output := CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1453_c11_3e79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1414_c6_12b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1445_c11_9c7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_85c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1424_DUPLICATE_0ff0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1424_DUPLICATE_0ff0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_9257] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_left;
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output := BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1431_c11_d7e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1464_c11_5fa5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1428_c11_fd94] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_left;
     BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output := BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1460_c11_a8bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1446_l1454_DUPLICATE_cc1c LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1446_l1454_DUPLICATE_cc1c_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1420_c11_cb14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_left;
     BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output := BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1423_c11_3381] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_left;
     BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output := BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1435_c32_1ca4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1414_c6_12b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1420_c11_cb14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1423_c11_3381_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1428_c11_fd94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1431_c11_d7e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_85c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_9257_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_9c7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1450_c11_a6e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1453_c11_3e79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1460_c11_a8bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1464_c11_5fa5_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1448_c3_8155 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1448_c21_bf9a_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1451_c3_2e5b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1451_c21_73ab_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1424_DUPLICATE_0ff0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1432_l1424_DUPLICATE_0ff0_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1446_l1454_DUPLICATE_cc1c_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1446_l1454_DUPLICATE_cc1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_DUPLICATE_a47b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1420_l1414_l1431_l1428_l1423_l1450_DUPLICATE_fad7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1420_l1445_l1442_l1437_l1464_l1431_l1460_l1428_l1453_l1423_l1450_DUPLICATE_5b87_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1431_l1428_l1453_l1423_l1450_DUPLICATE_56de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1420_l1414_l1437_l1428_l1423_DUPLICATE_e561_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1420_l1431_l1423_l1428_DUPLICATE_9355_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1464_l1431_l1460_l1428_l1423_l1450_DUPLICATE_3df0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1431_l1460_l1450_DUPLICATE_90f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1420_l1445_l1414_l1442_l1437_l1431_l1460_l1428_l1423_l1450_DUPLICATE_8a6a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1448_c3_8155;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1451_c3_2e5b;
     -- CONST_SL_8[uxn_opcodes_h_l1447_c3_4e33] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output := CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1425_c3_5df3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output := CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1464_c7_df57] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1414_c1_b44f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1454_c3_6332] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_left;
     BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output := BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1464_c7_df57] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1432_c3_ab77] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_left;
     BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output := BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1462_c24_5fcd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c24_5fcd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1462_c34_8d8d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1460_c7_d913] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1435_c32_8025] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_left;
     BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output := BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1435_c32_1375_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1435_c32_8025_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1432_c3_ab77_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1462_c24_5fcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1425_c3_5df3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1447_c3_4e33_return_output;
     VAR_printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1414_c1_b44f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1464_c7_df57_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1464_c7_df57_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1460_c7_d913] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- MUX[uxn_opcodes_h_l1435_c32_1375] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1435_c32_1375_cond <= VAR_MUX_uxn_opcodes_h_l1435_c32_1375_cond;
     MUX_uxn_opcodes_h_l1435_c32_1375_iftrue <= VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iftrue;
     MUX_uxn_opcodes_h_l1435_c32_1375_iffalse <= VAR_MUX_uxn_opcodes_h_l1435_c32_1375_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1435_c32_1375_return_output := MUX_uxn_opcodes_h_l1435_c32_1375_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1458_c24_0f40] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1458_c24_0f40_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1454_c3_6332_return_output);

     -- t16_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1460_c7_d913] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output := result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1460_c7_d913] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- printf_uxn_opcodes_h_l1415_c3_abb3[uxn_opcodes_h_l1415_c3_abb3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1415_c3_abb3_uxn_opcodes_h_l1415_c3_abb3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1458_c24_0f40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue := VAR_MUX_uxn_opcodes_h_l1435_c32_1375_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1460_c7_d913_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1453_c7_198b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1453_c7_198b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- t16_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1450_c7_bf90] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1450_c7_bf90_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- t16_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c7_7b11] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1445_c7_7b11_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- t16_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_0e95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1442_c7_0e95_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_9f92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1437_c7_9f92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1431_c7_4d5f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1431_c7_4d5f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1428_c7_7ac8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1428_c7_7ac8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1423_c7_ee73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1423_c7_ee73_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1420_c7_9b7f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1420_c7_9b7f_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1414_c2_816e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1410_l1469_DUPLICATE_4f3b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1410_l1469_DUPLICATE_4f3b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f637(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1414_c2_816e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1414_c2_816e_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1410_l1469_DUPLICATE_4f3b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1410_l1469_DUPLICATE_4f3b_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
