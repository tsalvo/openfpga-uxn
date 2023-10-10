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
-- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_b7a9]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2364_c1_a59d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2364_c2_562f]
signal n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_562f]
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2364_c2_562f]
signal t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2364_c2_562f]
signal tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2365_c3_e670[uxn_opcodes_h_l2365_c3_e670]
signal printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_c1a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2370_c7_409e]
signal n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2370_c7_409e]
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2370_c7_409e]
signal t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2370_c7_409e]
signal tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_c414]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2373_c7_8c5c]
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_a49b]
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2378_c7_00c2]
signal tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_968c]
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2381_c7_c938]
signal n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2381_c7_c938]
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2381_c7_c938]
signal t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2381_c7_c938]
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2382_c3_ec4e]
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_f94e]
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2385_c7_fef2]
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_6917]
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2388_c7_d9b0]
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2393_c11_354c]
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2393_c7_5dc5]
signal tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2396_c11_2145]
signal BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2396_c7_aa0d]
signal tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2397_c3_29cf]
signal BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_d7f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output : unsigned(0 downto 0);

-- BIN_OP_DIV[uxn_opcodes_h_l2398_c26_5e6d]
signal BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right : unsigned(15 downto 0);
signal BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output : unsigned(15 downto 0);

-- MUX[uxn_opcodes_h_l2398_c11_8f9c]
signal MUX_uxn_opcodes_h_l2398_c11_8f9c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2401_c32_dbeb]
signal BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2401_c32_0973]
signal BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2401_c32_3bcd]
signal MUX_uxn_opcodes_h_l2401_c32_3bcd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_1147]
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2403_c7_adc7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_adc7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_adc7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c7_adc7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2403_c7_adc7]
signal result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_25c0]
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_9f6e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_9f6e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_9f6e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_9f6e]
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2411_c34_2708]
signal CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_e5bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_3d98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_3d98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output);

-- n16_MUX_uxn_opcodes_h_l2364_c2_562f
n16_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- t16_MUX_uxn_opcodes_h_l2364_c2_562f
t16_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2364_c2_562f
tmp16_MUX_uxn_opcodes_h_l2364_c2_562f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond,
tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue,
tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse,
tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

-- printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670
printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670 : entity work.printf_uxn_opcodes_h_l2365_c3_e670_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output);

-- n16_MUX_uxn_opcodes_h_l2370_c7_409e
n16_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e
result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- t16_MUX_uxn_opcodes_h_l2370_c7_409e
t16_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2370_c7_409e
tmp16_MUX_uxn_opcodes_h_l2370_c7_409e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond,
tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue,
tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse,
tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output);

-- n16_MUX_uxn_opcodes_h_l2373_c7_8c5c
n16_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- t16_MUX_uxn_opcodes_h_l2373_c7_8c5c
t16_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c
tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond,
tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output);

-- n16_MUX_uxn_opcodes_h_l2378_c7_00c2
n16_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2
result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2
result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- t16_MUX_uxn_opcodes_h_l2378_c7_00c2
t16_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2
tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond,
tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right,
BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output);

-- n16_MUX_uxn_opcodes_h_l2381_c7_c938
n16_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938
result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- t16_MUX_uxn_opcodes_h_l2381_c7_c938
t16_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2381_c7_c938
tmp16_MUX_uxn_opcodes_h_l2381_c7_c938 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond,
tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue,
tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse,
tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e
BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left,
BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right,
BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right,
BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output);

-- n16_MUX_uxn_opcodes_h_l2385_c7_fef2
n16_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2
result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2
tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond,
tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue,
tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse,
tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right,
BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output);

-- n16_MUX_uxn_opcodes_h_l2388_c7_d9b0
n16_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0
result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0
tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond,
tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue,
tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse,
tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c
BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left,
BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right,
BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output);

-- n16_MUX_uxn_opcodes_h_l2393_c7_5dc5
n16_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5
result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5
tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond,
tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue,
tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse,
tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145
BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left,
BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right,
BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output);

-- n16_MUX_uxn_opcodes_h_l2396_c7_aa0d
n16_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d
result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d
tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond,
tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue,
tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse,
tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf
BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left,
BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right,
BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0 : entity work.BIN_OP_EQ_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output);

-- BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d
BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d : entity work.BIN_OP_DIV_uint16_t_uint16_t_0CLK_2b0015ee port map (
BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left,
BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right,
BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output);

-- MUX_uxn_opcodes_h_l2398_c11_8f9c
MUX_uxn_opcodes_h_l2398_c11_8f9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2398_c11_8f9c_cond,
MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue,
MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse,
MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb
BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left,
BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right,
BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973
BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left,
BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right,
BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output);

-- MUX_uxn_opcodes_h_l2401_c32_3bcd
MUX_uxn_opcodes_h_l2401_c32_3bcd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2401_c32_3bcd_cond,
MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue,
MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse,
MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right,
BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7
result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7
result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond,
result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2411_c34_2708
CONST_SR_8_uxn_opcodes_h_l2411_c34_2708 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x,
CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e
CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output,
 n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output,
 n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output,
 n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output,
 n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output,
 n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output,
 n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output,
 n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output,
 n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output,
 n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output,
 BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output,
 MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output,
 MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_9aad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_bf82 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_4d95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_b5da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_92af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_daca : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_8a76 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_b642 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_d440 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2407_c24_8239_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_91c8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2411_c24_28d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2396_l2409_DUPLICATE_e2ca_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2418_l2360_DUPLICATE_e3b8_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_4d95 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2376_c3_4d95;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right := to_unsigned(11, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_8a76 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2391_c3_8a76;
     VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_bf82 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2371_c3_bf82;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_91c8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_91c8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_b642 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2394_c3_b642;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_b5da := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2379_c3_b5da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_92af := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2383_c3_92af;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_daca := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2386_c3_daca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_9aad := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_9aad;
     VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_d440 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_d440;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left := VAR_phase;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right := t16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := tmp16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c6_b7a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2388_c11_6917] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_left;
     BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output := BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2385_c11_f94e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_25c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_a49b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2396_l2409_DUPLICATE_e2ca LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2396_l2409_DUPLICATE_e2ca_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2401_c32_dbeb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_left;
     BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output := BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output := result.is_stack_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2381_c11_968c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_e5bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2393_c11_354c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2407_c24_8239] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2407_c24_8239_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2396_c11_2145] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_left;
     BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output := BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2403_c11_1147] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_left;
     BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output := BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2370_c11_c1a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_c414] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2411_c34_2708] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output := CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2398_c11_d7f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2401_c32_dbeb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c6_b7a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2370_c11_c1a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_c414_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_a49b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2381_c11_968c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2385_c11_f94e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2388_c11_6917_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2393_c11_354c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2396_c11_2145_return_output;
     VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2398_c11_d7f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2403_c11_1147_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_25c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_e5bb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2382_l2389_l2374_l2397_DUPLICATE_7a4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2407_c24_8239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_6a25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2396_l2370_l2393_l2388_l2385_l2413_l2381_l2409_DUPLICATE_3d7c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2378_l2403_l2373_l2370_l2393_l2364_l2388_l2385_l2381_DUPLICATE_e5b7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2388_l2385_l2381_DUPLICATE_ffed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2413_l2381_l2409_DUPLICATE_371a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2396_l2409_DUPLICATE_e2ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2396_l2409_DUPLICATE_e2ca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2378_l2373_l2396_l2370_l2393_l2364_l2388_l2385_l2381_l2409_DUPLICATE_9d85_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2397_c3_29cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_left;
     BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output := BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_3d98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2403_c7_adc7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2411_c24_28d1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2411_c24_28d1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2411_c34_2708_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2382_c3_ec4e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_left;
     BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output := BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2364_c1_a59d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_3d98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2401_c32_0973] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_left;
     BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output := BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_9f6e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2401_c32_0973_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2382_c3_ec4e_return_output;
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2397_c3_29cf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2411_c24_28d1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2390_l2375_DUPLICATE_733e_return_output;
     VAR_printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2364_c1_a59d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_3d98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2403_c7_adc7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_9f6e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- BIN_OP_DIV[uxn_opcodes_h_l2398_c26_5e6d] LATENCY=0
     -- Inputs
     BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_left;
     BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right <= VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_right;
     -- Outputs
     VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output := BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output;

     -- MUX[uxn_opcodes_h_l2401_c32_3bcd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2401_c32_3bcd_cond <= VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_cond;
     MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue <= VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iftrue;
     MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse <= VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output := MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_9f6e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_9f6e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;

     -- printf_uxn_opcodes_h_l2365_c3_e670[uxn_opcodes_h_l2365_c3_e670] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2365_c3_e670_uxn_opcodes_h_l2365_c3_e670_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse := VAR_BIN_OP_DIV_uxn_opcodes_h_l2398_c26_5e6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_MUX_uxn_opcodes_h_l2401_c32_3bcd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_9f6e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     -- MUX[uxn_opcodes_h_l2398_c11_8f9c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2398_c11_8f9c_cond <= VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_cond;
     MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue <= VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iftrue;
     MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse <= VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output := MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2403_c7_adc7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output := result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2403_c7_adc7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2403_c7_adc7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue := VAR_MUX_uxn_opcodes_h_l2398_c11_8f9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2403_c7_adc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2396_c7_aa0d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2396_c7_aa0d_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- t16_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2393_c7_5dc5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_cond;
     tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output := tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2393_c7_5dc5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2388_c7_d9b0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_cond;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output := tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2388_c7_d9b0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2385_c7_fef2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2385_c7_fef2_return_output;
     -- n16_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2381_c7_c938] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2381_c7_c938_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2378_c7_00c2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_cond;
     tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output := tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2378_c7_00c2_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2373_c7_8c5c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2373_c7_8c5c_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2370_c7_409e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2370_c7_409e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c2_562f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;

     -- Submodule level 13
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2364_c2_562f_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2418_l2360_DUPLICATE_e3b8 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2418_l2360_DUPLICATE_e3b8_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c2_562f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2364_c2_562f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2418_l2360_DUPLICATE_e3b8_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2418_l2360_DUPLICATE_e3b8_return_output;
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
