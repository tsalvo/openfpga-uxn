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
-- Submodules: 103
entity lda2_0CLK_2b0015ee is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda2_0CLK_2b0015ee;
architecture arch of lda2_0CLK_2b0015ee is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1895_c6_d5be]
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c1_c5f4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1895_c2_70a4]
signal t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1896_c3_6295[uxn_opcodes_h_l1896_c3_6295]
signal printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_27a4]
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1900_c7_3b9e]
signal t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_1e2c]
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1903_c7_fcca]
signal t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1905_c3_8503]
signal CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1908_c11_4018]
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1908_c7_31aa]
signal t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_b3f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1911_c7_3aa1]
signal t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1912_c3_e992]
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1914_c32_2da7]
signal BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1914_c32_b7de]
signal BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1914_c32_de70]
signal MUX_uxn_opcodes_h_l1914_c32_de70_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1914_c32_de70_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1914_c32_de70_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1914_c32_de70_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1917_c11_9884]
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1917_c7_e0ed]
signal tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_8745]
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1921_c7_5ccd]
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1923_c3_2acf]
signal CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1924_c21_a7dc]
signal BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_9636]
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1926_c7_54fa]
signal tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1927_c21_018e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_21a2]
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1929_c7_15d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_15d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1929_c7_15d1]
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_15d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1929_c7_15d1]
signal tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1930_c3_087b]
signal BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1935_c11_80fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1935_c7_76cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1935_c7_76cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1935_c7_76cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1935_c7_76cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1937_c34_7076]
signal CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_6f60]
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_b3ca]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_b3ca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3413( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be
BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left,
BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right,
BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4
result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4
result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4
result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4
result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4
result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4
tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- t16_MUX_uxn_opcodes_h_l1895_c2_70a4
t16_MUX_uxn_opcodes_h_l1895_c2_70a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond,
t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue,
t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse,
t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

-- printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295
printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295 : entity work.printf_uxn_opcodes_h_l1896_c3_6295_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right,
BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e
tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- t16_MUX_uxn_opcodes_h_l1900_c7_3b9e
t16_MUX_uxn_opcodes_h_l1900_c7_3b9e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond,
t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue,
t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse,
t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right,
BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca
result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca
tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- t16_MUX_uxn_opcodes_h_l1903_c7_fcca
t16_MUX_uxn_opcodes_h_l1903_c7_fcca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond,
t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue,
t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse,
t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1905_c3_8503
CONST_SL_8_uxn_opcodes_h_l1905_c3_8503 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x,
CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left,
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right,
BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa
result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa
result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa
result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa
tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- t16_MUX_uxn_opcodes_h_l1908_c7_31aa
t16_MUX_uxn_opcodes_h_l1908_c7_31aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond,
t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue,
t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse,
t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1
tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- t16_MUX_uxn_opcodes_h_l1911_c7_3aa1
t16_MUX_uxn_opcodes_h_l1911_c7_3aa1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond,
t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue,
t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse,
t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992
BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right,
BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7
BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left,
BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right,
BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de
BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left,
BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right,
BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output);

-- MUX_uxn_opcodes_h_l1914_c32_de70
MUX_uxn_opcodes_h_l1914_c32_de70 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1914_c32_de70_cond,
MUX_uxn_opcodes_h_l1914_c32_de70_iftrue,
MUX_uxn_opcodes_h_l1914_c32_de70_iffalse,
MUX_uxn_opcodes_h_l1914_c32_de70_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left,
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right,
BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed
tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond,
tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right,
BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd
tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond,
tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf
CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x,
CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc
BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left,
BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right,
BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right,
BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa
result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa
tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond,
tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue,
tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse,
tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right,
BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1
tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond,
tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b
BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left,
BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right,
BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc
BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd
result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd
result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd
result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1937_c34_7076
CONST_SR_8_uxn_opcodes_h_l1937_c34_7076 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x,
CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right,
BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output,
 CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output,
 MUX_uxn_opcodes_h_l1914_c32_de70_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output,
 CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output,
 CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f920 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_5877 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c918 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_8100 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1914_c32_de70_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1914_c32_de70_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1924_c3_a0d6 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_e675 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1932_c3_61a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1933_c24_9f09_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8e61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_ba59_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1904_l1912_DUPLICATE_fb9b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1922_l1930_DUPLICATE_0b11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1944_l1891_DUPLICATE_5d0b_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1932_c3_61a1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1932_c3_61a1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8e61 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1936_c3_8e61;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right := to_unsigned(9, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right := to_unsigned(5, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right := to_unsigned(10, 4);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f920 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1897_c3_f920;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c918 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1906_c3_c918;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_8100 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1909_c3_8100;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_5877 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1901_c3_5877;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1921_c11_8745] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_left;
     BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output := BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1908_c11_4018] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_left;
     BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output := BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1937_c34_7076] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output := CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1935_c11_80fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output := result.stack_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1939_c11_6f60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_left;
     BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output := BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1895_c6_d5be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_left;
     BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output := BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1911_c11_b3f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1927_c21_018e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1903_c11_1e2c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1904_l1912_DUPLICATE_fb9b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1904_l1912_DUPLICATE_fb9b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1922_l1930_DUPLICATE_0b11 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1922_l1930_DUPLICATE_0b11_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1900_c11_27a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1926_c11_9636] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_left;
     BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output := BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1929_c11_21a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1914_c32_2da7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_left;
     BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output := BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1917_c11_9884] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_left;
     BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output := BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1924_c21_a7dc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1914_c32_2da7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1895_c6_d5be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1900_c11_27a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1903_c11_1e2c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1908_c11_4018_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1911_c11_b3f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1917_c11_9884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1921_c11_8745_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1926_c11_9636_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1929_c11_21a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1935_c11_80fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1939_c11_6f60_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1924_c3_a0d6 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1924_c21_a7dc_return_output, 16);
     VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_e675 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1927_c21_018e_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1904_l1912_DUPLICATE_fb9b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1904_l1912_DUPLICATE_fb9b_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1922_l1930_DUPLICATE_0b11_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1922_l1930_DUPLICATE_0b11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1911_l1908_l1903_l1900_l1895_DUPLICATE_a049_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1908_l1903_l1900_l1926_l1895_DUPLICATE_4b09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1929_l1900_l1926_DUPLICATE_a7c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1917_l1908_l1903_l1900_l1895_DUPLICATE_3bd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1939_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_5324_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1935_l1926_DUPLICATE_cb5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1921_l1917_l1911_l1908_l1935_l1903_l1900_l1926_l1895_DUPLICATE_f52b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1924_c3_a0d6;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1927_c3_e675;
     -- BIN_OP_GT[uxn_opcodes_h_l1914_c32_b7de] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_left;
     BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output := BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1930_c3_087b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_left;
     BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output := BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1939_c7_b3ca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1895_c1_c5f4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1937_c24_ba59] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_ba59_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1937_c34_7076_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1939_c7_b3ca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1935_c7_76cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1923_c3_2acf] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output := CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1905_c3_8503] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output := CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1912_c3_e992] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_left;
     BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output := BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1914_c32_de70_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1914_c32_b7de_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1912_c3_e992_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1937_c24_ba59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1905_c3_8503_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1923_c3_2acf_return_output;
     VAR_printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1895_c1_c5f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1939_c7_b3ca_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1933_c24_9f09] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1933_c24_9f09_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1930_c3_087b_return_output);

     -- result_stack_value_MUX[uxn_opcodes_h_l1935_c7_76cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1929_c7_15d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;

     -- MUX[uxn_opcodes_h_l1914_c32_de70] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1914_c32_de70_cond <= VAR_MUX_uxn_opcodes_h_l1914_c32_de70_cond;
     MUX_uxn_opcodes_h_l1914_c32_de70_iftrue <= VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iftrue;
     MUX_uxn_opcodes_h_l1914_c32_de70_iffalse <= VAR_MUX_uxn_opcodes_h_l1914_c32_de70_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1914_c32_de70_return_output := MUX_uxn_opcodes_h_l1914_c32_de70_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1935_c7_76cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- t16_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1935_c7_76cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1929_c7_15d1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_cond;
     tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output := tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;

     -- printf_uxn_opcodes_h_l1896_c3_6295[uxn_opcodes_h_l1896_c3_6295] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1896_c3_6295_uxn_opcodes_h_l1896_c3_6295_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1933_c24_9f09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue := VAR_MUX_uxn_opcodes_h_l1914_c32_de70_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1935_c7_76cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1929_c7_15d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1929_c7_15d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1929_c7_15d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;

     -- t16_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1929_c7_15d1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- t16_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1926_c7_54fa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1926_c7_54fa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1921_c7_5ccd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1921_c7_5ccd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1917_c7_e0ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1917_c7_e0ed_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1911_c7_3aa1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1911_c7_3aa1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1908_c7_31aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1908_c7_31aa_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1903_c7_fcca] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1903_c7_fcca_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1900_c7_3b9e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1900_c7_3b9e_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1895_c2_70a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1944_l1891_DUPLICATE_5d0b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1944_l1891_DUPLICATE_5d0b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3413(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1895_c2_70a4_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1944_l1891_DUPLICATE_5d0b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1944_l1891_DUPLICATE_5d0b_return_output;
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
